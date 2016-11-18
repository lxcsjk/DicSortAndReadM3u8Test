//
//  ViewController.m
//  ReadM3u8Test
//
//  Created by LXC on 2016/9/25.
//  Copyright © 2016年 LXC. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@property (strong, nonatomic) MPMoviePlayerController *streamPlayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    NSURL *streamURL = [NSURL URLWithString:@"http://oe1yonk4t.bkt.clouddn.com/zefwc5mg4K.m3u8"];
//    
//    self.streamPlayer = [[MPMoviePlayerController alloc] initWithContentURL:streamURL];
//    [self.streamPlayer.view setFrame:self.view.bounds];
//    self.streamPlayer.controlStyle = MPMovieControlStyleEmbedded;
//    
//    [self.view addSubview: self.streamPlayer.view];
//    [self.streamPlayer play];
/*
 
 
 */
    NSDictionary *dic=@{
                               @"00:00:05" : @"http://ocd2lp9uj.bkt.clouddn.com/Fp5oTh8STapNCphQOFSTTLlSN2H-",
                               @"00:00:10" : @"http://ocd2lp9uj.bkt.clouddn.com/FtufeLq_mgpEwZfF3lreFJMrjZPr",
                               @"00:00:13" : @"http://ocd2lp9uj.bkt.clouddn.com/FoV8-ENSw-GGoTybrL9dTB01Vu_f",
                               @"00:00:15" : @"http://ocd2lp9uj.bkt.clouddn.com/FqIWvspSYUFqKPTIjZGYZQcKkrfg",
                               @"00:00:18" : @"http://ocd2lp9uj.bkt.clouddn.com/FsOPeYHCvXoXMoGktFFew82s9xJk",
                               @"00:00:21" : @"http://ocd2lp9uj.bkt.clouddn.com/FtOoAan4XK_xLs-qoWJ76MOfAxbS",
                               @"00:00:24" : @"http://ocd2lp9uj.bkt.clouddn.com/Fp-BtbyCXZbcwuCLOF2CHuAL_P2p",
                               @"00:00:26" : @"http://ocd2lp9uj.bkt.clouddn.com/FgWaLBy24py6JWqU774vtWRwzuI-",
                               @"00:00:29" : @"http://ocd2lp9uj.bkt.clouddn.com/FgWaLBy24py6JWqU774vtWRwzuI-",
                               @"00:00:30" : @"http://ocd2lp9uj.bkt.clouddn.com/Fp-BtbyCXZbcwuCLOF2CHuAL_P2p",
                               @"00:00:31" : @"http://ocd2lp9uj.bkt.clouddn.com/FtOoAan4XK_xLs-qoWJ76MOfAxbS",
                               @"00:00:36" : @"http://ocd2lp9uj.bkt.clouddn.com/FsOPeYHCvXoXMoGktFFew82s9xJk",
                               @"00:00:37" : @"http://ocd2lp9uj.bkt.clouddn.com/FtOoAan4XK_xLs-qoWJ76MOfAxbS",
                               @"00:00:38" : @"http://ocd2lp9uj.bkt.clouddn.com/FsOPeYHCvXoXMoGktFFew82s9xJk",
                               @"00:00:39" : @"http://ocd2lp9uj.bkt.clouddn.com/FtOoAan4XK_xLs-qoWJ76MOfAxbS",
                               @"00:00:40" : @"http://ocd2lp9uj.bkt.clouddn.com/FsOPeYHCvXoXMoGktFFew82s9xJk",
                               @"00:00:41" : @"http://ocd2lp9uj.bkt.clouddn.com/FoV8-ENSw-GGoTybrL9dTB01Vu_f",
                               @"00:00:42" : @"http://ocd2lp9uj.bkt.clouddn.com/FtufeLq_mgpEwZfF3lreFJMrjZPr",
                               @"00:00:43" : @"http://ocd2lp9uj.bkt.clouddn.com/Frj30mBc8_YRLxrvSCLkTSs8z8MT",
    };
    
    NSMutableArray *arrkey=[[NSMutableArray alloc] init];
    
    
    NSArray *arr=[dic allKeys];
    NSLog(@"%@",arr);
    NSString *name=@"http://ocd2lp9uj.bkt.clouddn.com/FtOoAan4XK_xLs-qoWJ76MOfAxbS";
    for (NSString *key in arr)
    {
        if (  [name isEqualToString:[dic objectForKey:key] ] )
        {
            [arrkey addObject:key];
        }
        
    }

    NSLog(@"name＝ 哈哈 的id 如下：%@",arrkey);
    
    NSMutableArray *arrkeys =[[NSMutableArray alloc] init];
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"HH:mm:ss"];
    
    for (int i = 0; i<arrkey.count; i++) {
        NSString* string = arrkey[i];
        NSDate* inputDate = [inputFormatter dateFromString:string];
        NSLog(@"date = %@", inputDate);
        [arrkeys addObject:inputDate];
    }
    
    NSLog(@"排序前%@",arrkeys);
    for (int i = 0; i < arrkeys.count - 1; i++) {
        //比较的躺数
        for (int j = 0; j <arrkeys.count - 1 - i; j++) {
            //比较的次数
            NSComparisonResult result = [arrkeys[j] compare:arrkeys[j + 1]];
            if (result == NSOrderedDescending) {
                //这里为升序排序
                NSDate *temp = arrkeys[j];
                arrkeys[j] = arrkeys[j + 1];
                //OC中的数组只能存储对象，所以这里转换成string对象
                arrkeys[j + 1] = temp;
            }
        }
    }
    NSLog(@"排序后%@",arrkeys);
    NSLog(@"最早的时间为  =============   %@",[inputFormatter stringFromDate:arrkeys[0]]);
    NSLog(@"最晚的时间为  =============   %@",[inputFormatter stringFromDate:arrkeys[arrkeys.count - 1]]);
        
    NSArray *earlyTimeArr = [@"00:01:43" componentsSeparatedByString:@":"];
    
    NSArray *countTimeArr = [@"00:02:43" componentsSeparatedByString:@":"];

    
    int earlySec = [earlyTimeArr[0] intValue]*3600 + [earlyTimeArr[1] intValue]*60 + [earlyTimeArr[2] intValue];
    
    int countSec = [countTimeArr[0] intValue]*3600 + [countTimeArr[1] intValue]*60 + [countTimeArr[2] intValue];
    
    double ll = earlySec * 1.0f / countSec;
    NSLog(@"num =====  %d",earlySec);
    NSLog(@"num =====  %d",countSec);

    NSLog(@"num =====  %f",ll);
    
    UISwipeGestureRecognizer *swipeGR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipeGR.numberOfTouchesRequired =1;
    //设置轻扫动作的方向
    swipeGR.direction =UISwipeGestureRecognizerDirectionRight|UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGR];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)swipe:(UISwipeGestureRecognizer *)gr{
    NSLog(@"...");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
