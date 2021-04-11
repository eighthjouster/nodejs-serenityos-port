// Copyright 2013 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "src/libplatform/task-queue.h"

#include "include/v8-platform.h"
#include "src/base/logging.h"
#include "src/base/platform/platform.h"
#include "src/base/platform/time.h"

namespace v8 {
namespace platform {

#ifdef _ENABLE_SEMAPHORES
TaskQueue::TaskQueue() : process_queue_semaphore_(0), terminated_(false) {}
#else
TaskQueue::TaskQueue() : terminated_(false) {}
#endif

TaskQueue::~TaskQueue() {
  base::MutexGuard guard(&lock_);
  DCHECK(terminated_);
  DCHECK(task_queue_.empty());
}

void TaskQueue::Append(std::unique_ptr<Task> task) {
  base::MutexGuard guard(&lock_);
  DCHECK(!terminated_);
  task_queue_.push(std::move(task));
#ifdef _ENABLE_SEMAPHORES
  process_queue_semaphore_.Signal();
#endif
}

std::unique_ptr<Task> TaskQueue::GetNext() {
  for (;;) {
    {
      base::MutexGuard guard(&lock_);
      if (!task_queue_.empty()) {
        std::unique_ptr<Task> result = std::move(task_queue_.front());
        task_queue_.pop();
        return result;
      }
      if (terminated_) {
#ifdef _ENABLE_SEMAPHORES
        process_queue_semaphore_.Signal();
#endif
        return nullptr;
      }
    }
#ifdef _ENABLE_SEMAPHORES
    process_queue_semaphore_.Wait();
#endif
  }
}


void TaskQueue::Terminate() {
  base::MutexGuard guard(&lock_);
  DCHECK(!terminated_);
  terminated_ = true;
#ifdef _ENABLE_SEMAPHORES
  process_queue_semaphore_.Signal();
#endif
}

void TaskQueue::BlockUntilQueueEmptyForTesting() {
  for (;;) {
    {
      base::MutexGuard guard(&lock_);
      if (task_queue_.empty()) return;
    }
    base::OS::Sleep(base::TimeDelta::FromMilliseconds(5));
  }
}

}  // namespace platform
}  // namespace v8
