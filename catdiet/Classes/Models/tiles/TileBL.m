//
//  TileBL.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/09.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TileBL.h"


@implementation TileBL

- (id)init {
    self = [super init];
	if (self) {
        _tileSprite = [CCSprite spriteWithFile:@"tile9.png"];
        [self addChild:_tileSprite];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (MOVE_DIRECTION)getMoveDirection:(TILE_POSITION)startPosition {
    switch (startPosition) {
        case TILE_BOTTOM:
            return BOTTOM_TO_LEFT;
        case TILE_LEFT:
            return LEFT_TO_BOTTOM;
        default:
            return MOVE_NONE;
    }
}

@end
