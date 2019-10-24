# BI450-lm-cy
Projects in Data Acquisition and Signal Processing in Biomedical Applications —— Yu Chen &amp; Meng Li.


**Information about THIS course**

Website: [Data Acquisition and Signal Processing in Biomedical Applications](https://sjtucourse.github.io/BI450/)

## Project 0
**Assignments** :

* 成功将USB-4704接入电脑
* 测试USB-4704功能
  * 模拟输入/输出
  * 数字输入/输出
  * 计数器
* 成功将ELVIS II+接入电脑
* 测试ELVIS II+功能

**Final Report** : 

[项目零_YuChen_MengLi](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/%E9%A1%B9%E7%9B%AE%E9%9B%B6_YuChen_MengLi.pdf)


## Project 1
**Assignments**:

1、 熟悉 ELVIS II+，利用信号发生器功能产生信号，类型为正弦波和方波，频率不大于 100Hz。

  * 信号发生器
    * 正弦/方波
    * 频率 ≤ 100 Hz

2、 通过 USB-4704 的模拟输入端和 DAQ Navi 采集所产生信号，对比产生波形和采集波形，并记录；

3、 利用 DAQ Navi SDK，选择一门语言进行编程，编写用户界面供显示和用户交互，程序需实现以下功能：

* 通过 USB-4704 的模拟输入端采集信号，并显示至用户界面上（实时或准实时）；
  * 实时显示

* 将所采集的信号数据以文件格式（csv 或其它）保存至硬盘上，便于后续信号处理；
  * 将信号数据存入要求格式的文件
  * 波形回放
    * 导入所存取的信号文件
    * 显示波形
* 可对所采集信号进行 FFT、放大和滤波（针对方波信号进行低通和高通）等处理；
  * 波形处理
    * FFT
    * 滤波 (针对方波)
* 可设置不同采样率；
* 可停止和继续采集；
* 具备对时间轴和电压轴进行缩放的功能；
  * 波形调整 (放大/缩小)
    * 水平方向 (时间轴)
    * 竖直方向 (电压轴)
* 实现多通道模拟输入；
* 用鼠标选择波形上某个数据点时，可显示该点对应的数值；

4、 完成程序编码后，对程序进行测试和调试，记录所遇到的问题及如何处理；

5、 通过测试后，发布可执行文件，并在第三方 PC 上进行功能展示；

6、 项目报告包括以下内容：

* 程序开发逻辑；
* 总结测试中出现的问题及其解决方案；
* 如何针对不同频率的信号设置合适的采样率，并分析设置采样率时考虑的因素；
* 分析 USB-4704 的模拟输入功能可采集信号的频率范围，若输入信号在该范围外，会出现哪些问题，并探讨可能的解决方案；

