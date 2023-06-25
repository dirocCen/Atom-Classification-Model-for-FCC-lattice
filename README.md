# Atom-Classification-Model-for-FCC-lattice

## 第一步:生成不等价的集团环境
```
I_generate_inequitable_cluster.m
```
“perms_1_13atoms.txt”文件是截断环境对称操作表（此时是分子）可用sagar生成，该脚本通过遍历的方式生成所有对称不等价的环境集团。


## 第二步：根据输入结构生成关联函数
```
II_main_get_cc_whichposcar_1th.m
```
遍历的结构的信息保存在“seq”文件中，读取这些结构并将其转化成关联函数cc，cc中的每一行代表一个具体结构，对应的编号保存在whichposcar中。


## 第三步：计算关联函数的凸点
```
III_calculate_convexhull.m
```
这是算法的核心步骤，在“Linp_conv2()”函数中主要完成对关联函数的分类任务。核心是在“estCon_linp2()”函数中判断待定点是否在凸集内，判断的思路可以看https://www.cs.mcgill.ca/~fukuda/soft/polyfaq/node22.html 。
得到的凸点关联函数保存在M_convex中。

## 第四步：画出各分量凸点结构数随超胞原子数增长图
```
IV_plot_atomsN_convexN.m
```







