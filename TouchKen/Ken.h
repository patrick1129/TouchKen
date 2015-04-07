//
//  Ken.h
//  TouchKen
//
//  Created by Stronger Shen on 2015/1/30.
//  Copyright (c) 2015年 MobileIT. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Ken;
//interface外的實作在viewController.m檔
//protocol
@protocol KenDelegate <NSObject>

@optional
- (void)Ken:(Ken *)ken didFinishedMovedWithStatus:(NSDictionary *)status;
- (void)Ken:(Ken *)ken didTouchedKenTag:(long)tag;

@end




//interface內的實作在ken.m檔
@interface Ken : UIView
{
    CGPoint location;
}

@property (strong, nonatomic) id<KenDelegate> delegate;

- (Ken *)initWithPoint:(CGPoint)point atDirection:(int)direction;

- (void)GoRight;
- (void)GoLeft;

@end
