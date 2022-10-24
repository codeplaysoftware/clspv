// RUN: clspv %s --cl-std=CL3.0 --use-native-builtins=atomic_flag_test_and_set,atomic_flag_clear -o %t.spv -verify

kernel void flag_global(global int *out, global atomic_flag *flag) {
//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  *out = atomic_flag_test_and_set(flag);
//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  atomic_flag_clear(flag);

//expected-warning@+2{{memory_order_seq_cst is treated as memory_order_acq_rel}}
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_seq_cst, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_acq_rel, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_acquire, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_release, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_relaxed, memory_scope_sub_group);

//expected-warning@+2{{memory_order_seq_cst is treated as memory_order_acq_rel}}
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  atomic_flag_clear_explicit(flag, memory_order_seq_cst, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  atomic_flag_clear_explicit(flag, memory_order_release, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  atomic_flag_clear_explicit(flag, memory_order_relaxed, memory_scope_sub_group);

//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_seq_cst, memory_scope_work_group);
//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  atomic_flag_clear_explicit(flag, memory_order_seq_cst, memory_scope_work_group);

//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_seq_cst, memory_scope_device);
//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  atomic_flag_clear_explicit(flag, memory_order_seq_cst, memory_scope_device);
}

kernel void flag_local(global int *out, local atomic_flag *flag) {
//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  *out = atomic_flag_test_and_set(flag);
//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  atomic_flag_clear(flag);

//expected-warning@+2{{memory_order_seq_cst is treated as memory_order_acq_rel}}
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_seq_cst, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_acq_rel, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_acquire, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_release, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_relaxed, memory_scope_sub_group);

//expected-warning@+2{{memory_order_seq_cst is treated as memory_order_acq_rel}}
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  atomic_flag_clear_explicit(flag, memory_order_seq_cst, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  atomic_flag_clear_explicit(flag, memory_order_release, memory_scope_sub_group);
//expected-warning@+1{{memory_scope_sub_group is strengthened to memory_order_work_group}}
  atomic_flag_clear_explicit(flag, memory_order_relaxed, memory_scope_sub_group);

//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_seq_cst, memory_scope_work_group);
//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  atomic_flag_clear_explicit(flag, memory_order_seq_cst, memory_scope_work_group);

//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  *out = atomic_flag_test_and_set_explicit(flag, memory_order_seq_cst, memory_scope_device);
//expected-warning@+1{{memory_order_seq_cst is treated as memory_order_acq_rel}}
  atomic_flag_clear_explicit(flag, memory_order_seq_cst, memory_scope_device);
}

