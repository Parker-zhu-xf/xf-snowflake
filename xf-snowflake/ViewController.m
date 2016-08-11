//
//  ViewController.m
//  xf-snowflake
//
//  Created by 朱晓峰 on 16/8/10.
//  Copyright © 2016年 朱晓峰. All rights reserved.
//

#import "ViewController.h"
#define WIDTH (self.view.frame.size.width)
#define HEIGHT (self.view.frame.size.height)
@interface ViewController ()
{
    UIImage *flake;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    flake=[UIImage imageNamed:@"2.png"];
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(ontimer) userInfo:nil repeats:YES];
    
    
    
}
-(void)ontimer{
    UIImageView *imageView=[[UIImageView alloc]initWithImage:flake];
    int startX=round(random() % (int)WIDTH);
    int endX=round(random()%(int)WIDTH);
    double scale=1/round(random()%100)+1.0;
    double speed=1/round(random()%100)+1.0;
    imageView.frame=CGRectMake(startX, -100, 25*scale, 25*scale);
    imageView.alpha=0.5;
    
    [self.view addSubview:imageView];
    [UIView animateWithDuration:5*speed animations:^{
        imageView.frame=CGRectMake(endX,HEIGHT , 25*scale, 25*scale);
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
//    [UIView beginAnimations:nil context:(__bridge void *)(imageView)];
//    [UIView setAnimationDuration:5*speed];
//    imageView.frame=CGRectMake(endX,HEIGHT , 25*scale, 25*scale);
//    
//    [UIView commitAnimations];
//    if (imageView.frame.origin.y==HEIGHT) {
//        [imageView removeFromSuperview];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
