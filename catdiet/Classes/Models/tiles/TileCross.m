//
//  TileCross.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/09.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TileCross.h"


@implementation TileCross

- (id)init {
    self = [super init];
	if (self) {
        _tileSprite = [CCSprite spriteWithFile:@"tile1.png"];
        [self addChild:_tileSprite];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (MOVE_DIRECTION)getMoveDirection:(TILE_POSITION)startPosition {
    switch (startPosition) {
        case TILE_LEFT:
            return LEFT_TO_RIGHT;
        case TILE_RIGHT:
            return RIGHT_TO_LEFT;
        case TILE_TOP:
            return TOP_TO_BOTTOM;
        case TILE_BOTTOM:
            return BOTTOM_TO_TOP;
        default:
            return MOVE_NONE;
    }
}

@end
