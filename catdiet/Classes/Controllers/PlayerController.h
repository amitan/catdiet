//
//  PlayerController.h
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/09.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"

@interface PlayerController : CCNode {
    Player *player;
}
@property (nonatomic, retain)Player *player;

// 動作を開始
- (void)startController;

// 指定したタイルにいるプレイヤーを指定した位置から指定した位置まで移動する
- (void)moveTo:(CGPoint)toPosition from:(CGPoint)fromPosition;

@end
