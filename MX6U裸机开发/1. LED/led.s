.global _start @全局标号

/*
1.CCGR0～CCGR6控制所有外设时钟，设置为0xffffffff启动所有时钟
2.io复用，将寄存器
IOMUX_SW_MUX_CTL_PAD_GPIO1_IO03
的bit3～设置为0101
3.设置寄存器
IOMUX_SW_MUX_CTL_PAD_GPIO1_IO03
来设置gpio3的压摆率 速度 驱动能力 上下拉等
4.配置gpio输入输出寄存器
GPIO1_DR
bit3：1为输出模式
bit1：1为高电平 0为低电平
*/



_start:
    @使能所有外设时钟
    ldr r0, =0x020c4068 @把r0寄存器指向CCGR0地址
    ldr r1, =0xffffffff @把值存放到r0
    str r1, [r0]        @把值写入到CCGR0
    
    ldr r0, =0x020c406c @CCGR1
    ldr r1, =0xffffffff 
    str r1, [r0]
    
    ldr r0, =0x020c4070 @CCGR2
    ldr r1, =0xffffffff 
    str r1, [r0]
    
    ldr r0, =0x020c4074 @CCGR2
    ldr r1, =0xffffffff 
    str r1, [r0]
    
    ldr r0, =0x020c4078 @CCGR4
    ldr r1, =0xffffffff
    str r1, [r0]
    
    ldr r0, =0x020c407c @CCGR5
    ldr r1, =0xffffffff 
    str r1, [r0]
    
    ldr r0, =0x020c4080 @CCGR6
    ldr r1, =0xffffffff 
    str r1, [r0]

    @将复用为gpio
    ldr r0, =0x020e0068
    ldr r1, =0x5
    str r1, [r0]
    
    @配置压摆率 速度 驱动能力 上下拉
    ldr r0, =0x020e02f4
    ldr r1, =0x10b0
    str r1, [r0]
    
    @配置端口为输出
    ldr r0, =0x0209c004
    ldr r1, =0x8
    str r1, [r0]
    
    @配置端口为输出0
    ldr r0, =0x0209c000
    ldr r1, =0
    str r1, [r0]
    
loop:
    b loop

    
    
    
    
 