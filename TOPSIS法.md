## TOPSIS法

![截屏2025-08-16 21.09.16](/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2021.09.16.png)

我们怎样衡量候选人A和C到好和差的距离呢？

我们可以建立平面直角坐标系，将颜值作为横坐标，将每月争吵次数作为纵坐标，这样就可以就A，B，C到好(9,3)和差(6,10)进行距离计算，那么这里的距离就是欧式距离。那么距离最好点最近的或者说距离最差点最远的一个就是综合下来条件最好的。

以上就是对TOPSIS法一个简单的引入。TOPSIS法可以翻译为逼近理想解排序法或者优劣解**距离**法。TOPSIS法中有两个需要了解到概念：

1. 理想解：即设想的最优的解，它的各个属性值都达到各备选方案中最好的值(上面例子中的(9,3))；
2. 负理想解：即设想的最劣的解，他的各个属性值都打到各备选方案中最坏的值(上面例子中的(6,10))。

TOPSIS法就是通过最接近理想解且最远离负理想解来确定最优选择。

<img src="/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2021.22.03.png" alt="截屏2025-08-16 21.22.03" style="zoom:50%;" />

### TOPSIS法解题基本步骤

1. 将原始矩阵正向化

   将所有指标类型转化为**极大型**指标；(就是让所有指标都是越大越好)

2. 正向矩阵标准化

   标准化的方法有很多种，主要目的是去除量纲的影响，保证不同评价指标在同一数量级，且数据大小排序不变；

3. 计算得分并归一化

   $s_i=\frac{D_i^-}{D_i^++D_i^-}$，其中$S_i$为得分，$D_i^+$为评价对象与最大值的距离，$D_i^-$为评价对象与最小值的距离。

我们将刚才的例子变得复杂一点，引入身高和体重两个新的指标。而且对于身高来说，KUN认为身高165cm是最好的，体重90-100斤最好。

<img src="/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2021.29.48.png" alt="截屏2025-08-16 21.29.48" style="zoom:50%;" />

在原始矩阵正向化之前，我们先来了解一下有哪些种类的指标。

<img src="/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2021.33.04.png" alt="截屏2025-08-16 21.33.04" style="zoom:50%;" />

对于这个问题，颜值是极大型指标，吵架次数是极小型指标，身高是中间型指标，体重是区间型指标。

那么这几种指标怎么转化成极大型指标呢？下面是具体方法：

<img src="/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2021.37.21.png" alt="截屏2025-08-16 21.37.21" style="zoom:50%;" />

- 下面就可以对原始**矩阵正向化**了：

<img src="/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2022.08.02.png" alt="截屏2025-08-16 22.08.02" style="zoom:50%;" />

- 正向化矩阵标准化：

<img src="/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2022.10.22.png" alt="截屏2025-08-16 22.10.22" style="zoom:50%;" />

其实就是将每个对象的每一个指标的评价转化为[0,1]之间的值，但是并不是归一化，归一化分母应该是加和。

标准化以后，我们还要将每一个指标的权重考虑进去，权重的确定方法很多：层次分析法，熵权法，Delphi法，对数最小二乘法等。我们现在假设在这个问题中每个指标的权重相同，即均为0.25。所以这里对于标准化后的正向化矩阵就不用在进行加权操作了。

<img src="/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2022.15.53.png" alt="截屏2025-08-16 22.15.53" style="zoom:50%;" />

- 计算得分并归一化：

<img src="/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2022.18.46.png" alt="截屏2025-08-16 22.18.46" style="zoom:50%;" />
经过上面的一系列操作，我们只要将每一列的最大值挑出来就可以得到最大值的定义了，同理可以得到最小值的定义，只需挑出每一列的最小值就可以了。

我们这里距离还是按照欧式距离来计算，第$i(i=1,2,\ldots,n)$个评价对象与最大值之间的距离$D_i^+=\sqrt{\sum_{j=1}^{m}(z_j^+-z_{ij})^2}$。同理，也可以得到评价对象与最小值之间的距离$D_i^-=\sqrt{\sum_{j=1}^{m}(z_j^--z_{ij})^2}$，然后就可以算出第i个评价对象未进行归一化后的得分：$S_i=\frac{D_i^-}{D_i^++D_i^-}$。

简单分析我们就可以看出，$D_i^+$增大还是$D_i^-$减小都会导致得分变小。

最后我们将得分归一化并换算成百分制：$\tilde{S_i}=\frac{S_i}{\sum_{i=1}^{n}S_i}\times100$

最后该例题的结果如下：

<img src="/Users/huohuade/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2025-08-16%2022.37.28.png" alt="截屏2025-08-16 22.37.28" style="zoom:50%;" />