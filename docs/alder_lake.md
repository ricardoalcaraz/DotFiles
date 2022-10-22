Intel's Alder Lake possesses a unique BIG.little architecture that I haven't seen too much documentation on so here is my setup for a 12700k that takes advantage of the little cores. You can find my full libvirt config at the end


# Alder lake setup
Here's the neofetch readout for the host machine:
>                    -`                     
>                   .o+`                   --------------- 
>                  `ooo/                   OS: Arch Linux x86_64 
>                 `+oooo:                  Kernel: 5.19.3-arch1-1 
>                `+oooooo:                 Uptime: 5 mins 
>                -+oooooo+:                Packages: 1617 (pacman) 
>              `/:-:++oooo+:               Shell: zsh 5.9 
>             `/++++/+++++++:              Terminal: /dev/pts/0 
>            `/++++++++++++++:             CPU: 12th Gen Intel i7-12700K (20) @ 5 
>           `/+++ooooooooooooo/`           GPU: Intel AlderLake-S GT1 
>          ./ooosssso++osssssso+`          GPU: NVIDIA GeForce RTX 3090 
>         .oossssso-````/ossssss+`         Memory: 418MiB / 63954MiB 
>        -osssssso.      :ssssssso.
>       :osssssss/        osssso+++.                               
>      /ossssssss/        +ssssooo/-                               
>    `/ossssso+/:-        -:/+osssso+-
>   `+sso+:-`                 `.-/+oso:
>  `++:.                           `-/+/


Motherboard is a Asus Prime Z690 Wifi D4. Here are the IOMMU groups for reference:


    IOMMU Group 0: 00:00.0 Host bridge [0600]: Intel Corporation 12th Gen Core Processor Host Bridge/DRAM Registers [8086:4668] (rev 02)
    IOMMU Group 1: 00:01.0 PCI bridge [0604]: Intel Corporation 12th Gen Core Processor PCI Express x16 Controller #1 [8086:460d] (rev 02)
    IOMMU Group 2: 00:02.0 VGA compatible controller [0300]: Intel Corporation AlderLake-S GT1 [8086:4680] (rev 0c)
    IOMMU Group 3:00:06.0 PCI bridge [0604]: Intel Corporation 12th Gen Core Processor PCI Express x4 Controller #0 [8086:464d] (rev 02)
    IOMMU Group 4:00:08.0 System peripheral [0880]: Intel Corporation 12th Gen Core Processor Gaussian & Neural Accelerator [8086:464f] (rev 02)
    IOMMU Group 5:00:0a.0 Signal processing controller [1180]: Intel Corporation Platform Monitoring Technology [8086:467d] (rev 01)
    IOMMU Group 6:
      00:14.0 USB controller [0c03]: Intel Corporation Alder Lake-S PCH USB 3.2 Gen 2x2 XHCI Controller [8086:7ae0] (rev 11)
      00:14.2 RAM memory [0500]: Intel Corporation Alder Lake-S PCH Shared SRAM [8086:7aa7] (rev 11)
    IOMMU Group 7: 00:14.3 Network controller [0280]: Intel Corporation Alder Lake-S PCH CNVi WiFi [8086:7af0] (rev 11)
    IOMMU Group 8:
      00:15.0 Serial bus controller [0c80]: Intel Corporation Alder Lake-S PCH Serial IO I2C Controller #0 [8086:7acc] (rev 11)
      00:15.1 Serial bus controller [0c80]: Intel Corporation Alder Lake-S PCH Serial IO I2C Controller #1 [8086:7acd] (rev 11)
      00:15.2 Serial bus controller [0c80]: Intel Corporation Alder Lake-S PCH Serial IO I2C Controller #2 [8086:7ace] (rev 11)
    IOMMU Group 9: 00:16.0 Communication controller [0780]: Intel Corporation Alder Lake-S PCH HECI Controller #1 [8086:7ae8] (rev 11)
    IOMMU Group 10: 00:17.0 SATA controller [0106]: Intel Corporation Alder Lake-S PCH SATA Controller [AHCI Mode] [8086:7ae2] (rev 11)
    IOMMU Group 11: 00:1a.0 PCI bridge [0604]: Intel Corporation Device [8086:7ac8] (rev 11)
    IOMMU Group 12: 00:1b.0 PCI bridge [0604]: Intel Corporation Device [8086:7ac0] (rev 11)
    IOMMU Group 13: 00:1c.0 PCI bridge [0604]: Intel Corporation Alder Lake-S PCH PCI Express Root Port #1 [8086:7ab8] (rev 11)
    IOMMU Group 14: 00:1c.2 PCI bridge [0604]: Intel Corporation Device [8086:7aba] (rev 11)
    IOMMU Group 15: 00:1d.0 PCI bridge [0604]: Intel Corporation Alder Lake-S PCH PCI Express Root Port #9 [8086:7ab0] (rev 11)
    IOMMU Group 16: 00:1d.4 PCI bridge [0604]: Intel Corporation Alder Lake-S PCH PCI Express Root Port #13 [8086:7ab4] (rev 11)
    IOMMU Group 17:
      00:1f.0 ISA bridge [0601]: Intel Corporation Z690 Chipset LPC/eSPI Controller [8086:7a84] (rev 11)
      00:1f.3 Audio device [0403]: Intel Corporation Alder Lake-S HD Audio Controller [8086:7ad0] (rev 11)
      00:1f.4 SMBus [0c05]: Intel Corporation Alder Lake-S PCH SMBus Controller [8086:7aa3] (rev 11)
      00:1f.5 Serial bus controller [0c80]: Intel Corporation Alder Lake-S PCH SPI Controller [8086:7aa4] (rev 11)
    IOMMU Group 18:
      01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA102 [GeForce RTX 3090] [10de:2204] (rev a1)
      01:00.1 Audio device [0403]: NVIDIA Corporation GA102 High Definition Audio Controller [10de:1aef] (rev a1)
    IOMMU Group 19: 02:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983 [144d:a808]
    IOMMU Group 20: 06:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8125 2.5GbE Controller [10ec:8125] (rev 05)
    IOMMU Group 21: 08:00.0 Non-Volatile memory controller [0108]: Sandisk Corp WD Black SN750 / PC SN730 NVMe SSD [15b7:5006]


## Quirks
1. The bluetooth usb device does not work when passed into a VM. It is possible to get it working if you passthrough the USB interface but unfortunately it's an all or nothing affair since there is only one USB IOMMU group. I passthrough IOMMU group 6 & 7 to my guest as a result
2. iGPU is not supported on a windows guest. It is supported on a linux guest but I would not recommend it because it causes the guest to hang on shut down and needs intervention to shut it down. SR IOV seems to be coming and hopefully it'll come soon.
3. The thunderbolt add on functionality seems to be broken. The motherboard advertises that you can add thunderbolt support with the ThunderboltEX4 add-in card but I have not been able to get it work and it causes a prolonged POST so I'm not sure what is happening there. When the host finally does boot up, the hardware is seen and it has it's own groups but nothing that is plugged into the port is recognized. This is unfortunate because I have some thunderbolt hardware I was hoping to take advantage of and it would've mitigated quirk #1.
4. Frequency scaling was wonky and my initial attempt was not able to reach full turbo performance on a guest VM. I was able to fix it but I cannot offer any help here since I'm not sure what exactly I did to fix it. Also the guest VM will always report 3.6GHz which is a lie and nothing to worry about.

## Dynamic CPU isolation and thread pinning
The 4 "little" cores on the 12700k alder lake CPUs are quite powerful and I have found they are more than enough to run all of the host processes. They do share an L2 cache so they should always be kept together for optimal performance. Systemd supports dynamic resource isolation so I take advantage of this by pinning the host work to the little cores when a VM is active. The script is simple and should be placed at /etc/libvirt/hooks/qemu:


    #!/bin/sh

    command=$2

    if [ "$command" = "started" ]; then
        systemctl set-property --runtime -- system.slice AllowedCPUs=16-19
        systemctl set-property --runtime -- user.slice AllowedCPUs=16-19
        systemctl set-property --runtime -- init.scope AllowedCPUs=16-19
    elif [ "$command" = "release" ]; then
        systemctl set-property --runtime -- system.slice AllowedCPUs=0-19
        systemctl set-property --runtime -- user.slice AllowedCPUs=0-19
        systemctl set-property --runtime -- init.scope AllowedCPUs=0-19
    fi

You can then pin the performance cores to the vm and any libvirt/qemu threads to the host. The little cores share an L2 cache while the BIG cores each have their own L1 and L2 cache which offers some nice flexibility. For optimal performance always keep the little cores together. For my gaming VM I pin the work to the performance cores:


    <vcpu placement='static'>12</vcpu>
    <iothreads>1</iothreads>
    <cputune>
        <vcpupin vcpu='0' cpuset='0'/>
        <vcpupin vcpu='1' cpuset='1'/>
        <vcpupin vcpu='2' cpuset='2'/>
        <vcpupin vcpu='3' cpuset='3'/>
        <vcpupin vcpu='4' cpuset='4'/>
        <vcpupin vcpu='5' cpuset='5'/>
        <vcpupin vcpu='6' cpuset='6'/>
        <vcpupin vcpu='7' cpuset='7'/>
        <vcpupin vcpu='8' cpuset='8'/>
        <vcpupin vcpu='9' cpuset='9'/>
        <vcpupin vcpu='10' cpuset='10'/>
        <vcpupin vcpu='11' cpuset='11'/>
        <emulatorpin cpuset='16-19'/>
        <iothreadpin iothread='1' cpuset='16-19'/>
    </cputune>
    <cpu mode='host-passthrough'>
        <topology sockets='1' cores='6' threads='2'/>
    </cpu>


# Conclusion
I was able to achieve my goal of a single machine for gaming and productivity. The guest achieves near native performance to allow for flawless 4k gaming while still offering enough power for any productivity tasks on the host. If SR-IOV ever becomes usable then I will be updating my VMs to passthrough a virtual GPU for hardware accelerated video encoding since the built in hardware offers great quality even at 4k resolution. I also hope to play around with the neural accelerator in the future. It offers the ability to run inference algorithms so if anyone has any experience with that please share the documentation.


[Finally, here is my full libvirt config for reference](https://pastebin.com/raw/2KqBkFuK)

/proc/cpuinfo

Performance core:


    processor	: 15
    vendor_id	: GenuineIntel
    cpu family	: 6
    model		: 151
    model name	: 12th Gen Intel(R) Core(TM) i7-12700K
    stepping	: 2
    microcode	: 0x22
    cpu MHz		: 3600.000
    cache size	: 25600 KB
    physical id	: 0
    siblings	: 20
    core id		: 28
    cpu cores	: 12
    apicid		: 57
    initial apicid	: 57
    fpu		: yes
    fpu_exception	: yes
    cpuid level	: 32
    wp		: yes
    flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni     pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi     flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect avx_vnni dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp hwp_pkg_req hfi umip pku     ospke waitpkg gfni vaes vpclmulqdq tme rdpid movdiri movdir64b fsrm md_clear serialize pconfig arch_lbr flush_l1d arch_capabilities
    vmx flags	: vnmi preemption_timer posted_intr invvpid ept_x_only ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid unrestricted_guest vapic_reg vid ple shadow_vmcs ept_mode_based_exec tsc_scaling usr_wait_pause
    bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb
    bogomips	: 7222.00
    clflush size	: 64
    cache_alignment	: 64
    address sizes	: 46 bits physical, 48 bits virtual

Efficiency core:


    processor	: 16
    vendor_id	: GenuineIntel
    cpu family	: 6
    model		: 151
    model name	: 12th Gen Intel(R) Core(TM) i7-12700K
    stepping	: 2
    microcode	: 0x22
    cpu MHz		: 3799.965
    cache size	: 25600 KB
    physical id	: 0
    siblings	: 20
    core id		: 36
    cpu cores	: 12
    apicid		: 72
    initial apicid	: 72
    fpu		: yes
    fpu_exception	: yes
    cpuid level	: 32
    wp		: yes
    flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni     pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi     flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect avx_vnni dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp hwp_pkg_req hfi umip pku     ospke waitpkg gfni vaes vpclmulqdq tme rdpid movdiri movdir64b fsrm md_clear serialize pconfig arch_lbr flush_l1d arch_capabilities
    vmx flags	: vnmi preemption_timer posted_intr invvpid ept_x_only ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid unrestricted_guest vapic_reg vid ple shadow_vmcs ept_mode_based_exec tsc_scaling usr_wait_pause
    bugs		: spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb
    bogomips	: 7222.00
    clflush size	: 64
    cache_alignment	: 64
    address sizes	: 46 bits physical, 48 bits virtual