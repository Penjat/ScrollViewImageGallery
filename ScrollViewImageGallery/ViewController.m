//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Spencer Symington on 2019-01-21.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong,nonatomic)NSArray *imageNameArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    
    self.imageNameArray = @[@"reboot",@"freakazoid",@"spongebob",@"powerrangers" ];
    self.pageControl.numberOfPages = self.imageNameArray.count;
    self.pageControl.currentPage = 0;
    NSLog(@"creating images");
    [self createimageFromArray:self.imageNameArray];
    
}
-(void)createimageFromArray:(NSArray<NSString*>*)imageNames{
    
    int i = 0;
    UIImageView *previousImage = nil;
    for(NSString *imageName in imageNames){
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        
        [self.scrollView addSubview:image];
        
        image.translatesAutoresizingMaskIntoConstraints = NO;
        
        image.contentMode = UIViewContentModeScaleAspectFill;
        image.clipsToBounds = YES;
        
        //set width and height
        [image.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
        
        [image.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
        
        //check if it is the first image
        if(previousImage == nil){
            //if so conect it to the view
            [image.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
            
        }else{
            //if there is a previous image, connect to that
            [previousImage.trailingAnchor constraintEqualToAnchor:image.leadingAnchor].active = YES;
        }
        
        //check if it is the last image
        if(imageNames.count -1 == i ){
            [image.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
        }
        
        previousImage = image;
        [self.scrollView addSubview:image];
        i++;
        
    }
    
}
- (IBAction)pageChanged:(UIPageControl*)sender {
    
    NSLog(@"page changed %li",(long)sender.currentPage);
    
    long page = sender.currentPage;
    float x = (self.scrollView.frame.size.width*page);
    float y = 0;
    float width = self.scrollView.frame.size.width;
    float height = self.scrollView.frame.size.height;
    
    
    CGRect frame = CGRectMake(x, y,width ,height ); //wherever you want to scroll
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
}
- (IBAction)userTapped:(id)sender {
    NSLog(@"tap detected.");
    
   
    [self performSegueWithIdentifier:@"toDetails" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSString*)sender{
    NSLog(@"preparing for segue");
    DetailViewController* detailViewController = segue.destinationViewController;
    
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    //detailViewController.imageView.image = [UIImage imageNamed: @"reboot"];
    
    [detailViewController sendImageName:self.imageNameArray[page]];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}

@end
