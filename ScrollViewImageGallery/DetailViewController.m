//
//  DetailViewController.m
//  ScrollViewImageGallery
//
//  Created by Spencer Symington on 2019-01-21.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong,nonatomic)UIView *hud;
@property (strong,nonatomic)UIView *smallHud;

@property (nonatomic)float wholeImageScaling;//the zoom at which the entire image is visable
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.delegate = self;
    self.imageView.image = [UIImage imageNamed:self.imageName];
    
    //figure out the scalling between the frame and the image size
    //find for width
    float scalingFactorX = self.view.frame.size.width / self.imageView.image.size.width;
    
    //find for height
    float scalingFactorY = self.view.frame.size.height / self.imageView.image.size.height;
    
    //then choose the smaller one
    if(scalingFactorX < scalingFactorY){
        self.scrollView.zoomScale = scalingFactorX;
       
    }else{
        self.scrollView.zoomScale = scalingFactorY;
    }
    self.wholeImageScaling = self.scrollView.zoomScale;
    //self.hud.hidden = YES;
    [self createHud];
    
}
-(void)createHud{
    
    float heightWidthRatio = self.imageView.image.size.height / self.imageView.image.size.width;
    float width = 200.0;
    float height = width * heightWidthRatio;
    
    self.hud = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.hud];
    
    self.hud.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.hud.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.3];
    
    NSLayoutConstraint *widthCon = [NSLayoutConstraint constraintWithItem:self.hud
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                               toItem:nil
                                            attribute:NSLayoutAttributeNotAnAttribute
                                           multiplier:1
                                             constant:width];
    
    NSLayoutConstraint *heightCon = [NSLayoutConstraint constraintWithItem:self.hud
                                             attribute:NSLayoutAttributeHeight
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:nil
                                             attribute:NSLayoutAttributeNotAnAttribute
                                            multiplier:1
                                              constant:height];
    
    
    NSLayoutConstraint *leftCon = [NSLayoutConstraint constraintWithItem:self.hud
                                            attribute:NSLayoutAttributeLeftMargin
                                            relatedBy:NSLayoutRelationEqual
                                               toItem:self.view
                                            attribute:NSLayoutAttributeLeftMargin
                                           multiplier:1
                                             constant:0];
    NSLayoutConstraint *topCon = [NSLayoutConstraint constraintWithItem:self.hud
                                                              attribute:NSLayoutAttributeTopMargin
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeTopMargin
                                                             multiplier:1
                                                               constant:40];
    
    
    
    
    [NSLayoutConstraint activateConstraints:@[heightCon,widthCon,topCon,leftCon]];
    
    //get ratio between screen height and width
    float smallWidth = (self.view.frame.size.width / self.imageView.image.size.width)*(200.0 / self.view.frame.size.width)*self.view.frame.size.width/self.scrollView.zoomScale;
    
    float smallHeight = (self.view.frame.size.height / self.imageView.image.size.height)*(200.0 / self.view.frame.size.height)*self.view.frame.size.height/self.scrollView.zoomScale;
    
    if(smallWidth > width){
        smallWidth = width;
    }
    if(smallHeight > height){
        smallHeight = height;
    }
    
    self.smallHud = [[UIView alloc]initWithFrame:CGRectMake(0, 0, smallWidth, smallHeight)];
    
    
    self.smallHud.backgroundColor = UIColor.yellowColor;
    [self.hud addSubview:self.smallHud];
}
//-(void)updateHud{
//    NSLog(@"offsetX = %f , image width = %f , contentWidth = %f",self.scrollView.contentOffset.x,  self.imageView.image.size.width,self.scrollView.contentSize.width);
//
//    //these ratios are wrong somewhere
//    float smallX = self.scrollView.contentOffset.x *(self.hud.bounds.size.width /self.view.bounds.size.width)*(self.view.frame.size.width / self.scrollView.contentSize.width);
//
//    float smallY = self.scrollView.contentOffset.y *(self.hud.frame.size.height /self.view.frame.size.height)*(self.view.frame.size.height / self.scrollView.contentSize.height);
//
//    float smallWidth = (self.view.frame.size.width / self.scrollView.contentSize.width)*(200.0 / self.view.frame.size.width)*self.view.frame.size.width/self.scrollView.zoomScale;
//
//    float smallHeight = (self.view.frame.size.height / self.scrollView.contentSize.height)*(200.0 / self.view.frame.size.height)*self.view.frame.size.height/self.scrollView.zoomScale;
//
//
//    NSLog(@"hud frame width %f",self.hud.frame.size.width);
//    if(smallWidth+smallX > self.hud.frame.size.width){
//        smallWidth = self.hud.frame.size.width-smallX;
//
//    }
//    if(smallHeight+smallY > self.hud.frame.size.height){
//        smallHeight = self.hud.frame.size.height-smallY;
//    }
//    self.smallHud.frame = CGRectMake(smallX,smallY,smallWidth, smallHeight);
//}

-(void)updateHud{
    float hudWidth = self.hud.frame.size.width;
    float hudHeight = self.hud.frame.size.height;
    NSLog(@"hudWidth:%f hudHeight:%f",hudWidth,hudHeight);
    
    float phoneWidth = self.view.frame.size.width;
    float phoneHeight = self.view.frame.size.height;
    NSLog(@"phoneWidth:%f phoneHeight:%f",phoneWidth,phoneHeight);
    
    float contentWidth = self.scrollView.contentSize.width;
    float contentHeight = self.scrollView.contentSize.height;
    NSLog(@"contentWidth:%f contentHeight:%f",contentWidth,contentHeight);
    
    float smallWidth = hudWidth*phoneWidth/contentWidth;
    float smallHeight = hudHeight*phoneHeight/contentHeight;
    
    float smallX = self.scrollView.contentOffset.x*hudWidth/contentWidth;
    
    float smallY = self.scrollView.contentOffset.y*hudHeight/contentHeight;
    
    
    if(smallWidth+smallX > hudWidth){
                smallWidth = hudWidth-smallX;
        
            }
            if(smallHeight+smallY > hudHeight){
                smallHeight = hudHeight-smallY;
            }
    
    self.smallHud.frame = CGRectMake(smallX,smallY,smallWidth, smallHeight);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    //check to see if we need to show the hud
    
    return self.imageView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self updateHud];
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    if(self.scrollView.zoomScale < self.wholeImageScaling){
        self.hud.hidden = YES;
    }else{
        self.hud.hidden = NO;
    }
    [self updateHud];
}

-(void)sendImageName:(NSString*)imageName{
    NSLog(@"message recieved %@",imageName);
    //self.imageView.image = [UIImage imageNamed:imageName];
    self.imageName = imageName;
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
