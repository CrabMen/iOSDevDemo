//
//  ViewController.m
//  handle_Album_Select_GIF_Demo
//
//  Created by DragonLi on 2017/12/27.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <SDWebImage/UIImage+GIF.h>
#import <FLAnimatedImage/FLAnimatedImageView.h>
#import <FLAnimatedImage/FLAnimatedImage.h>
#import "PicModel.h"
#import "PicTestView.h"



@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,strong) PicTestView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PicTestView *imageView =[[PicTestView alloc]initWithFrame:CGRectMake(0, 100, 200, 200)];
    imageView.backgroundColor =[UIColor grayColor];
    [self.view addSubview:imageView];
    self.imageView = imageView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = (id)self;
    [self presentViewController:ipc animated:YES completion:nil];
}

#pragma mark =========================handle show


- (void)setttingWithData:(NSData *)data
                   image:(UIImage *)image{
    
    PicModel *model =[[PicModel alloc]init];
    model.data = data;
    model.image = image;
    self.imageView.showModel = model;
}
#pragma mark =========================methods


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    @autoreleasepool {
        // iOS 10  UIImagePickerControllerReferenceURL 过期
        NSString *assetString = [[info objectForKey:UIImagePickerControllerReferenceURL] absoluteString];
        if([assetString hasSuffix:@"GIF"]){
            
            ALAssetsLibrary *assetLibrary = [[ALAssetsLibrary alloc]init];
            [assetLibrary assetForURL:[info objectForKey:UIImagePickerControllerReferenceURL] resultBlock:^(ALAsset *asset) {
                ALAssetRepresentation *re = [asset representationForUTI:(__bridge NSString *)kUTTypeGIF];;
                NSUInteger size = (NSUInteger)re.size;
                uint8_t *buffer = malloc(size);
                NSError *error;
                NSUInteger bytes = [re getBytes:buffer fromOffset:0 length:size error:&error];
                NSData *data = [NSData dataWithBytes:buffer length:bytes];//这个就是选取的GIF图片的原二进制数据
                [self setttingWithData:data image:nil];
                free(buffer);
            } failureBlock:^(NSError *error) {
              // 失败
            }];
            
        } else {
             [self setttingWithData:nil image:info[UIImagePickerControllerOriginalImage]];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
