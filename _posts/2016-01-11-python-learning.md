---
layout: post
title:  "python基础语法学习记录笔记"
keywords: "python,learning"
description: "python的学习"
category: python
tags: [python]
---

#### 第一天-基础语法
注释后面空一格，逗号后面空一格，函数前面空两行，行后面的注释要空两格，语句里面的= > <左右都要空一格

``` python
#!/usr/bin/env python
# coding=utf-8
# 设置文件字符集编码,不设置使用中文会报错
print "hello world"
# input and output
name = raw_input('name:')  # waiting user input
print name, 'is who'  # str concat
 
# escape with \
print 'i \'m ok'
print True and False
print not True
# None like null in java
# usually use capital name variable name
print 10/3
print 10.0/3
# 字母和对应数字转化
print ord('A')
print chr(65)
# unicode 输出
print u'中文'
print u'中文'.encode('utf-8')
print len('abc')
 
# %运算符就是用来格式化字符串的。在字符串内部，%s表示用字符串替换，%d表示用整数替换，有几个%?占位符
# %d   整数
# %f   浮点数
# %s   字符串
# %x   十六进制整数
print 'Hi,%s,you hava save %d' % ('Xiaoming', 100000)
 
# list
classmates = ['xiaoming', 'xiaohong']
print len(classmates)
# gei last element
print classmates[-1]
classmates.insert(0, 'xiaogang')
print classmates[0]
 
# tuple immutable不可变
classmates = ('daming', 'dahong', 'dahei')
# 一个元素也要加上逗号
t = (22,)
print t[0]
t1 = (1, 2, ['xiaoming', 'xiaohong'])
t1[2].append('xiaohua')
print(t1[2][2])
 
# dict
d = {'xiaoming': 20, 'xiaohong': 26}
print d['xiaoming']
print d.get('233', 233)
# set 创建set 需要提供list作为输入 多个set可以做 & | 运算
s = set([1, 2, 3])
s.add(4)
print s
 
# if else
# end with colon is code block
a = 100
if a >= 0:
    print a
    print 2*a
else:
    print -a
birth = int(raw_input('birth:'))
if birth < 2000:
    print '00前'
else:
    print '00后'
```
#### 第二天-函数
``` python
#!/usr/bin/env python
# coding=utf-8
import math
 
print abs(-4)
# compare return 1/0/-1
print cmp(1, 3)
print int('233')
print float('222')
print str(111)
print unicode(100)
print bool(1)  # True
print bool('')  # False
a = abs
print a(int('-11'))
 
# define function
 
 
def my_abs(xs):  # 参数类型限制
    if not isinstance(xs, (int, float)):
        raise TypeError('bad operate ')
    if xs > 100:
        return xs
    else:
        return -xs
print my_abs(11)
 
 
def nop():  # 定义一个空函数
    pass
 
 
# return multi value 返回多个值,其实是返回一个tuple
def move(xs, ys, step, angle=0):
    nx = xs+step*math.cos(angle)
    ny = ys-step*math.sin(angle)
    return nx, ny
x, y = move(100, 100, 60, math.pi/6)
print x, y  # 151.961524227 70.0
r = move(100, 100, 60, math.pi/6)
print(r)  # (151.96152422706632, 70.0)
 
 
def power(xs, n=2):  # 添加默认值
    s = 1
    while n > 0:
        n -= 1  # 这个使用n=n-1会黄色警告建议使用augmented assignments(增强任务)
        s = s*xs
    return s
print power(10, 3)
print power(10)
 
 
def enroll(name, gender, age=6, city='beijing'):
    print 'name', name
    print 'gender', gender
    print 'age', age
    print 'city', city
print enroll('xiaoming', 2, city='bj')
 
 
def add_end(l=None):  # 如果L=[],则每次添加都会改变L的值 # 默认参数必须是不变对象
    if l is None:
        l = []
    l.append('END')
    return l
print add_end([1, 2])
 
 
def calc(numbers):  # mutable parameter可变参数#传入list或者tuple
    sums = 0
    for n in numbers:
        sums = sums+n*n
    return sums
print calc([1, 2, 3])
# print calc(1,2,3) error
 
 
def calc(*numbers):
    sums = 0
    for n in numbers:
        sums += n*n
    return sum
print calc(1, 2, 3)  # 注意和上面的区别
 
 
def test(*numbers):  # 将list或者tuple传入可变参数
    sums = 0
    for s in numbers:
        sums += s
    return sums
a = [1, 2, 3]
b = (2, 3, 4)
print test(*a)
print test(*b)
 
 
def person(name, age, **ks):  # 关键字参数**  接受一个dict
    print 'name', name, 'age', age, 'other', ks
person('', 22, say='high')
p = {'sex': 'man', 'height': 23}
person('xiaoming', 11, **p)
 
 
def func(a, b, c=0, *args, **kw):  # 参数组合
    print a, b, c, 'args=', args, 'kw=', kw
func(1, 2, 3, [4, 5, 6], x=99)  # 1 2 3 args= ([4, 5, 6],) kw= {'x': 99}
args = (1, 2, 3, 4, 5, 6)
kw = {'x': 99}
func(*args, **kw)  # 1 2 3 args= (4, 5, 6) kw= {'x': 99}
 
 
def fact(n):  # 递归
    if n == 1:
        return 1
    return fact(n-1)*n
print fact(100)
```
#### 第三天-高级特性
``` python
#!/usr/bin/env python
# coding=utf-8
 
from collections import Iterable
import os
 
# 切片
L = ['小华', '小红', '小丽', '小黑', '小刚']
r = L[0:3]  # 切片 L[x:y] 从第x个开始取y个 负数是从右到左
print(len(r))
L = range(100)  # 0-100
print L[:-10]  # 0-89
print L[-10:]  # 90-99
 
# 迭代
d = {'x': 1, 'y': 2, 'z': 3}
for k in d:
    print k  # 遍历key
for v in d.itervalues():
    print v  # 遍历value
for ch in 'ABC':
    print ch  # 遍历字符串
# 判断某个对象是否可被迭代
print isinstance('abc', Iterable)  # True
# 遍历索引和值
for i, v in enumerate(['A', 'B', 'C']):
    print i, v
for x, y in {(1, 2), (3, 4), (5, 6)}:
    print x, y
 
 
# 列表生成式 运用列表生成式，可以快速生成list，可以通过一个list推导出另一个list，而代码却十分简洁。
a = [x*x for x in range(1, 11)]  # [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
print a
b = [x*x for x in range(1, 11) if x % 2 == 0]  # [4, 16, 36, 64, 100]
print b
c = [m + n for m in 'ABC' for n in 'XYZ']  # ['AX', 'AY', 'AZ', 'BX', 'BY', 'BZ', 'CX', 'CY', 'CZ']
print c  # 全排列
d = [d for d in os.listdir('.')]  # ['day-2-funtion.py', 'day-3-advance-grammar.py', 'day1.py', 'rp-python.iml']
print d  # 列出当前目录的文件
# e = [k + '=' + v for k, v in {(1, 2), (3, 4), (5, 6)}]  # error
# print e
_e = {'x': 'A', 'y': 'B', 'z': 'C'}
e = [k + '=' + v for k, v in _e.iteritems()]
print e  # ['y=B', 'x=A', 'z=C']
 
 
# 生成器Generator
f = [x * x for x in range(10)]
print f  # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
g = (x * x for x in range(10))
print g  # <generator object <genexpr> at 0x022AD4E0>
print g.next(), g.next(), g.next()  # 0 1 4
for x in g:
    print x  # 9 16...
 
 
def fib(max):  # 斐波拉契数列（Fibonacci）
    n, a, b = 0, 0, 1
    while n < max:
        print b
        a, b = b, a+b
        n += 1
print fib(5)
 
 
def fib(max):  # 斐波拉契数列（Fibonacci）
    n, a, b = 0, 0, 1
    while n < max:
        yield b  # 如果一个函数定义中包含yield关键字，那么这个函数就不再是一个普通函数，而是一个generator：
        a, b = b, a+b
        n += 1
h = fib(6)
# 遇到yield语句返回，再次执行时从上次返回的yield语句处继续执行
for x in h:
    print x  # 1 1 2 3 5 8
```
#### 第四天-函数式编程
``` python
#!/usr/bin/env python
# coding=utf-8
# function programing
 
 
def add(x, y, f):
    return f(x)+f(y)
a = abs
b = add(-11, 2, a)
print b  # 13
 
 
def f(x):  # map 对list每个函数执行f
    return x*x
d = map(f, range(10))
print d  # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
# 复习之前的列表生成式
c = [x*x for x in range(10)]
print c
e = map(str, range(5))
print e  # ['0', '1', '2', '3', '4']
 
 
# reduce(f,[x1, x2 ,x3 ,x4])=f(f(f(x1, x2), x3), x4) reduce把结果继续和序列的下一个元素做累积计算
def fn(x, y):
    return x*10+y
f = reduce(fn, [1, 3, 5, 7, 9])
print f  # 13579
 
 
def char2num(s):
    return {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}[s]
print reduce(fn, map(char2num, '12345'))  # 12345
 
 
def str2int(s):
    def fn(x, y):
        return x*10+y
 
    def char2num(s):
        return {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}[s]
    return reduce(fn, map(char2num, s))
print str2int('2333')  # 2333
# ['adam', 'LISA', 'barT']，输出：['Adam', 'Lisa', 'Bart']。
print 'aaa'.capitalize()  # 首字母大小
 
 
def isOdd(n):
    return n % 2 == 1
g = filter(isOdd, [1, 3, 4, 5, 6])
print g  # [1, 3, 5]
 
 
def isPrime(n):  # 练习 判断素数
    x = 2
    while x < n:
        if n % x == 0:
            return False
        x += 1
    return True
print isPrime(5)
print filter(isPrime, [1, 3, 5, 6, 7, 8])  # [1, 3, 5, 7]
 
 
def _comp(x, y):  #
    if x > y:
        return -1
    if x < y:
        return 1
    return 0
print sorted([1, 3, 4, 2], _comp)  # [4, 3, 2, 1] 自定义排序规则
 
 
def cal_sum(*args):  # 返回函数
    def sum():
        ax = 0
        for n in args:
            ax += n
        return ax
    return sum
h = cal_sum(1, 2, 3, 4)
print h
print h()  # 10
 
 
def count():
    fs = []
    for x in range(1, 4):
        def f():
            return x*x
        fs.append(f)
    return fs
f1 = count()
print f1[0]()  # 9
f2, f3, f4 = count()  # 注意和上面那种定义方式的区别 count()返回到的是一个数组,数组里面存放的是函数
print f2()  # 9
print f3()  # 9
print f4()  # 9
 
 
def count():
    fs = []
    for i in range(1,4):
        def f(j):
            def g():
                return j*j
            return g
        fs.append(f(i))
    return fs
f2, f3, f4 = count()
print f2()  # 1
print f3()  # 4
print f4()  # 9
 
 
print map(lambda x: x*x, range(9))   # [0, 1, 4, 9, 16, 25, 36, 49, 64] # 匿名函数
h = lambda x:x*x
print h(5)  # 25
 
 
def log(fun):  # 装饰器
    def wrapper(*args, **ks):
        print 'call %s:' % fun.__name__
        return fun(*args, **ks)
    return wrapper
 
 
@log  # 等价于 now = log(now)
def now():  # 借助Python的@语法，把decorator置于函数的定义处：
    print '2016-1-12'
 
print now()  # call now: 2016-1-12
 
 
def log(text):
    def decorator(func):
        def wrapper(*args, **kw):
            print '%s %s():' % (text, func.__name__)
            return func(*args, **kw)
        return wrapper
    return decorator
 
 
@log('execute')  # now = log('execute')(now)
def now():
    print '2013-12-25'  # execute now(): 2013-12-25
print now()
```
#### 第五天-模块及面向对象编程
``` python
#!/usr/bin/env python
# coding=utf-8
"""
    a test module
    python在注释中有一个非常有用的东西是 doc String]
    第一行注释文件直接在Unix/Linux/Mac上运行
    第二行标识py文件本身使用utf-8编码
    sys.argv 默认参数只有一个是当前文件名字,可以带多个参数
    执行python test.pt para1 para2...
 
    __xxx__特殊变量,可以被直接饮用,一般都有特殊用途 如__name__ __author__ __doc__
    _xxx __xxx 用来定义private,不应该被直接饮用
 
    安装PIL(Python Imaging Library时使用 python install PIL不起作用,手动去http://www.pythonware.com/products/pil/下载的
 
        ['C:\\Java\\myblogworkspace\\rp\\rp-python\\pkg',
        'C:\\Java\\myblogworkspace\\rp\\rp-python',
        'C:\\Windows\\system32\\python27.zip', 'C:\\Python27\\DLLs',
        'C:\\Python27\\lib', 'C:\\Python27\\lib\\plat-win',
        'C:\\Python27\\lib\\lib-tk', 'C:\\Python27', 'C:\\Python27\\lib\\site-packages',
        'C:\\Python27\\lib\\site-packages\\PIL']
"""
from __future__ import unicode_literals
import sys
 
from PIL import Image
try:
    import cStringIO as StringIO
except ImportError:  # 导入失败会捕获到ImportError
    import StringIO
 
 
__author__ = 'rp'
 
print __name__  # __main__
 
 
def test():
    args = sys.argv
    print args
    if len(args) == 1:
        print 'hell`' \
              '`' \
              'o world'
    if len(args) == 2:
        print 'hello,%s' % args[1]
    else:
        print 'too many arguments!'
 
if __name__ == '__main__':
    test()
 
 
im = Image.open('test.jpg')
print im.format, im.size, im.mode  # JPEG (199, 60) RGB
im.thumbnail((5, 5))  # 生成图片的缩略图
im.save('thumb.jpg', 'JPEG')
 
 
# __future__模块，让你在旧的版本中试验新版本的一些特性。
print '\'xxx\' is unicode?', isinstance('xxx', unicode)
print 'u\'xxx\' is unicode?', isinstance(u'xxx', unicode)
print '\'xxx\' is str?', isinstance('xxx', str)
print 'b\'xxx\' is str?', isinstance(b'xxx', str)
```