#import "ViewController.h"
#import "NSString+Hash.h"
#import "DownLoadManager.h"


@interface ViewController ()
@end

@implementation ViewController
/**
 * 开始下载
 */
- (IBAction)start:(id)sender {
    // 启动任务
    NSString * downLoadUrl =  @"http://audio.xmcdn.com/group11/M01/93/AF/wKgDa1dzzJLBL0gCAPUzeJqK84Y539.m4a";

    [[DownLoadManager sharedInstance]downLoadWithURL:downLoadUrl progress:^(float progress) {
        NSLog(@"###%f",progress);
        
    } success:^(NSString *fileStorePath) {
        NSLog(@"###%@",fileStorePath);
        
    } faile:^(NSError *error) {
        NSLog(@"###%@",error.userInfo[NSLocalizedDescriptionKey]);
    }];
}
/**
 * 暂停下载
 */
- (IBAction)pause:(id)sender {
    [[DownLoadManager sharedInstance]stopTask];
}

@end



