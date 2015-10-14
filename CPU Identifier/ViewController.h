//
//  ViewController.h
//  CPU Identifier
//
//  Created by lololol on 14/Oct/15.
//  Copyright © 2015 nouvel. All rights reserved.
//

#import <UIKit/UIKit.h>

#include <sys/sysctl.h>
#include <sys/types.h>
#include <mach/mach.h>
#include <mach/processor_info.h>
#include <mach/mach_host.h>

@interface ViewController : UIViewController
{
    processor_info_array_t cpuInfo, prevCpuInfo;
    mach_msg_type_number_t numCpuInfo, numPrevCpuInfo;
    unsigned numCPUs;
    NSTimer *updateTimer;
    NSLock *CPUUsageLock;
}


@end

