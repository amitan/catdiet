//
//  GameBackgroundLayer.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameBackgroundLayer.h"


@implementation GameBackgroundLayer

- (id)init {
    self = [super init];
	if (self) {
        CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
        background.position = ccp(background.contentSize.width/2, background.contentSize.height/2);
        [self addChild:background];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

@end
