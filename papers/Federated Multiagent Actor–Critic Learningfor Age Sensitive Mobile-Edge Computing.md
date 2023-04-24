# Federated Multiagent Actor–Critic Learning for Age Sensitive Mobile-Edge Computing
---
- Data Generation Model

边缘设备数据元数据$(d.(t),w.(t),idx.(t))$

- Edge Mobility Model

$${pos}_k(t+1) = {pos}_k(t)+{move}_k(t) \tag{1}$$
$${move}_k(t) \leq r_{move}^k \tag{2}$$

- Edge Processing and Data Scheduling Model

$$\tau_n^k(t)=\frac{\sum_i\textbf{1}_{{idx}_{col}^{k,i}(t)=n}d_{col}^{k,i}(t)}{f_c^k(t)} \tag{3}$$
数据收集池$D_{col}^k$

$${exe}_k(t) = \left[ {exe}_1^k(t) ,\dots,{exe}_{B^k_{col}}^k(t) \right] \tag{4}$$
$$\sum_{i=1}^{B_{col}^k}{exe}_i^k(t)=1   \ \ \ \ \ {for}\ k=1,\dots,N_e. \tag{5}$$
上传到云端

$${off}_k(t) = \left[ {off}_1^k(t) ,\dots,{off}_{B^k_{col}}^k(t) \right] \tag{6}$$
$$\sum_{i=1}^{B_{exe}^k}{off}_i^k(t)=1   \ \ \ \ \ {for}\ k=1,\dots,N_e. \tag{7}$$

- Communication Model

只考虑边缘与数据源，边缘与云之间的数据交换，而不考虑边缘与边缘之间的通信，因为没有任务数据交互

- Problem Formulation

*AOI*: 在上面介绍的系统中，数据源Sn在第t个时隙的年龄被定义为当前时间和最新数据在接收器的生成时间的减法
$$ \Delta_n(t) = t - T_g^n(t) \tag{13} $$
为了保持及时性，目标是通过控制边缘设备，调度数据和有效分配资源来最小化所有数据源的平均年龄。
$$ \mathbf{P_1:} \min_{\{a_k(t)\},b_t} \left[ \bar{\Delta}(t) := \frac{1}{N_s}\sum_{n=1}^{N_s}\Delta_n(t) \right] \tag{14} $$

- MDP

对于边缘代理，其状态 {sk(t)} 包含对环境的本地观察，边缘设备的状态 (包括缓冲区状态，分配的卸载带宽等)。中心代理sC(t) 的状态由所有边缘设备状态组成。

在感兴趣的情况下，边缘设备将移动、收集数据、本地执行和卸载任务到云中心。然后，边缘代理的动作由移动、执行决策和卸载调度组成，用
$$\{a_k(t)\} = \{[{move}_k(t), {exe}_k(t), {off}_k(t)]\} \tag{15}$$

$$ b(t) $$

由于我们专注于年龄敏感的MEC系统中的边缘协作，在该系统中，所有代理都进行协作以最大程度地减少数据源的平均年龄，因此将为所有代理共享全局惩罚。然后，每个代理在第t个时隙的当前惩罚可以描述为
$$ p_k(t) = \bar{\Delta}(t)\ \ for\ k=1,\dots,N_e \tag{16}$$

$$P_k(t) = \sum_{i=0}^T\gamma^ip_k(t+i) \tag{17}$$
