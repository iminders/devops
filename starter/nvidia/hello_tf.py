import timeit

import tensorflow as tf

with tf.device('/gpu:0'):
    a0 = tf.random.normal([10000, 1000])
    b0 = tf.random.normal([1000, 2000])
    print(a0.device, b0.device)

with tf.device('/gpu:1'):
    a1 = tf.random.normal([10000, 1000])
    b1 = tf.random.normal([1000, 2000])
    print(a1.device, b1.device)


def run0():
    with tf.device('/gpu:0'):
        c = tf.matmul(a0, b0)
    return c


def run1():
    with tf.device('/gpu:1'):
        c = tf.matmul(a1, b1)
    return c


for i in range(10):
    cpu_time = timeit.timeit(run0, number=10)
    gpu_time = timeit.timeit(run1, number=10)
    print('warmup:', cpu_time, gpu_time)

    cpu_time = timeit.timeit(run0, number=10)
    gpu_time = timeit.timeit(run1, number=10)
    print('run time:', cpu_time, gpu_time)
    print(f'Count {i}/10000')
