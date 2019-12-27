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

[项目零_YuChen_MengLi](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/Project%200/%E9%A1%B9%E7%9B%AE%E9%9B%B6_YuChen_MengLi_.pdf)


## Project 1
**Assignments**:

1、 熟悉 ELVIS II+，利用信号发生器功能产生信号，类型为正弦波和方波，频率不大于 100Hz。
   通过 USB-4704 的模拟输入端和 DAQ Navi 采集所产生信号，对比产生波形和采集波形，并记录；

2、 利用 DAQ Navi SDK，选择一门语言进行编程，编写用户界面供显示和用户交互，程序需实现以下功能：

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

**程序逻辑图**

![程序逻辑图](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/Project%201/report/%E7%A8%8B%E5%BA%8F%E9%80%BB%E8%BE%91%E5%9B%BE.png)

**界面**

![界面](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/Project%201/report/%E7%95%8C%E9%9D%A2.png)

**Final Report** : 

[项目一_YuChen_MengLi](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/Project%201/report/%E9%A1%B9%E7%9B%AE%E4%B8%80_YuChen_MengLi.pdf)


## Project 2
**Assignments:** 

1、利用 DAQ Navi SDK，选择一门语言进行编程，程序须实现以下功能: 

* 编写用户界面供显示和用户交互; 
* 生成输出波形的数据(从已有文件中读取或手动编写); 
* 在界面上可显示输出波形; (4)可改变输出波形的频率和周期输出点数; 
* 可单次固定数量的数据输出，也可不间断地输出; (6)可开始、停止和继续输出信号;

2、通过 NI ELVIS II+采集输出信号，对比输出波形和采集波形，并记录结果; 

3、完成程序编码后，对程序进行测试和调试，记录所遇到的问题及如何处理; 

4、通过测试后，发布可执行文件，并在第三方 PC 上进行功能展示;

5、项目报告包括以下内容:

* 程序开发逻辑;
* 总结测试中出现的问题及其解决方案; 
* 如何针对不同频率的信号设置合适的周期输出点数，并分析设置周期输出点数时考虑的因素;
* 分析 USB-4704 的模拟输出功能可输出信号的频率范围，若输出信号在该范围外，会出现哪些问题，并探讨可能的解决方案;


**程序逻辑图**

![程序逻辑图](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/project%202/report/%E9%A1%B9%E7%9B%AE%E4%BA%8C_%E7%A8%8B%E5%BA%8F%E9%80%BB%E8%BE%91%E5%9B%BE.png)

**界面**

![界面](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/project%202/report/%E9%A1%B9%E7%9B%AE%E4%BA%8C_%E7%95%8C%E9%9D%A2.png)



**Final Report** : 

[项目二_YuChen_MengLi](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/project%202/report/%E9%A1%B9%E7%9B%AE%E4%BA%8C_YuChen_MengLi.pdf)


## Project 3
**Assignments:**

1、利用 DAQ Navi SDK，选择一门语言进行编程，程序需实现以下功能: 

* 编写用户界面供显示和用户交互; 

* 使用数字输出(DO)实现特定频率范围(小于 50Hz)的方波输出，可单次固定时间 的输出，也可不间断地输出;
* 可实时改变输出方波的频率;
* 可开始、停止和继续输出方波; 
* 使用数字输入(DI)在用户界面上实时显示设定频率的方波(或正弦波)波形，其中， 
  * 1路通道表示开始/停止输出
  * 2路通道表示幅度(0~3V)
  * 5路通道表示频率(0~31Hz);
 
2、通过 ELVIS II+采集输出的方波信号，测量方波频率，并判断是否和要求一致;

3、通过 ELVIS II+输出外部控制信号，观察用户界面显示的方波，并判断是否和要求一致;

4、完成程序编码后，对程序进行测试，通过测试后，发布可执行文件，并在第三方 PC 上 进行功能展示;

5、项目报告包括以下内容:

* 程序开发逻辑;
* 总结测试中出现的问题及其解决方案; 
* 确定采用 DO 输出方波的频率范围，并给出相应数据;


**程序逻辑图**

![程序逻辑图](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/project%203/report/%E9%A1%B9%E7%9B%AE%E4%B8%89_%E7%A8%8B%E5%BA%8F%E9%80%BB%E8%BE%91%E5%9B%BE.png)

**界面**

![界面](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/project%203/report/%E9%A1%B9%E7%9B%AE%E4%B8%89_%E7%95%8C%E9%9D%A2.png)



**Final Report** : 

[项目三_YuChen_MengLi](https://github.com/SelinaLi11/BI450-lm-cy/blob/master/project%203/report/%E9%A1%B9%E7%9B%AE%E4%B8%89_YuCheng_MengLi.pdf)


## Project 4
**Assignments:**

1、利用 DAQ Navi SDK 并结合 ELVIS II+，选择一门语言进行编程，程序需实现以下功能: 

* 集成项目一、二和三的功能模块，形成一个统一界面供用户交互; 
* 可独立完成模拟输入并显示、模拟输出和方波输出的功能;


2、通过 ELVIS II+和 USB-4704 进行功能验证; 

3、通过测试后，发布可执行文件，并在第三方 PC 上进行功能展示;

4、项目报告包括以下内容: 

* 程序开发逻辑; 
* 总结测试中出现的问题及其解决方案; 
* 界面使用说明(Readme);

5、自行录制三分钟短片，介绍如何使用最终项目的开发程序;


**程序逻辑图**

![程序逻辑图]()

**界面**

![界面]()

**Final Report** : 

[项目四_YuChen_MengLi]()




