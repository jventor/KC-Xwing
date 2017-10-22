//
//  ViewController.m
//  Xwing
//
//  Created by Jaime Ventor on 22/10/17.
//  Copyright © 2017 Jaime Ventor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget: self
                                                          action:@selector(userDidTap:)];
    
    [self.view addGestureRecognizer:tap];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                          action: @selector(userDidPan:)];
    [self.view addGestureRecognizer:pan];
  
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userDidSwipe:)];
    [self.view addGestureRecognizer:swipe];
}

-(void) userDidSwipe: (UISwipeGestureRecognizer *)swipe{
    if (swipe.state == UIGestureRecognizerStateRecognized){
        NSLog(@"Swipe!");
        static CGFloat angulo = 0;
        
            UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseInOut;
        
        [UIView animateWithDuration:3
                              delay:0
             usingSpringWithDamping:0.2
              initialSpringVelocity:0.8 options:options
                         animations:^{
                             angulo = angulo + M_2_PI;
                             self.xwingView.transform = CGAffineTransformMakeRotation(angulo);
                         } completion:^(BOOL finished) {
                             
                         }
         ];
    }
}

- (void) userDidPan: (UIPanGestureRecognizer *) pan{
    CGPoint newCenter = [pan locationInView:self.spaceView];

    UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseInOut;
    
    [UIView animateWithDuration:3
                          delay:0
                        options: options
                     animations:^{
                         self.xwingView.center = newCenter;
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
    [UIView animateWithDuration: 1.5
                          delay:0
                        options:
                     options
                     animations:^{
                         self.xwingView.alpha = 0;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration: 1.5
                                               delay:0
                                             options:
                          options
                                          animations:^{
                                              self.xwingView.alpha = 1;
                                          } completion:^(BOOL finished) {
                                              
                                          }];
                     }];
   
    
    
}

- (void) userDidTap: (UITapGestureRecognizer *) tap{
    CGPoint newCenter = [tap locationInView:self.spaceView];
    CGPoint oldCenter = self.xwingView.center;
    UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseInOut;
    
    [UIView animateWithDuration:2
                          delay:0
                        options: options
                     animations:^{
                         self.xwingView.center = newCenter;

                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
    [UIView animateWithDuration:1
                          delay:0
                        options: options
                     animations:^{
                         CGFloat angulo = oldCenter.x < newCenter.x ? M_2_PI : -M_2_PI;
                         self.xwingView.transform = CGAffineTransformMakeRotation(angulo);
                         
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:1
                                               delay:0
                                             options: options
                                          animations:^{
                                              self.xwingView.transform = CGAffineTransformIdentity;
                                          }
                                          completion:^(BOOL finished) {
                                              
                                          }
                          ];
                        
                     }
     ];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
