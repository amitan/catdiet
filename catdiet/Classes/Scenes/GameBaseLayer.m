//
//  GameBaseLayer.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/07.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameBaseLayer.h"
#import "GameUtil.h"

@implementation GameBaseLayer

- (id)init {
    self = [super init];
	if (self) {
        
        // タイル背景を追加
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile:@"tileback.png"];
        background.position = ccp(TILE_MARGIN_W - TILE_BORDER + background.contentSize.width/2, 
                                  winSize.height - TILE_MARGIN_H + TILE_BORDER - background.contentSize.height/2);
        [self addChild:background];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

@end
