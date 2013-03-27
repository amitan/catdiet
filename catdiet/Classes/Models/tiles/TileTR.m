//
//  TileTR.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/09.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TileTR.h"


@implementation TileTR

- (id)init {
    self = [super init];
	if (self) {
        _tileSprite = [CCSprite spriteWithFile:@"tile8.png"];
        [self addChild:_tileSprite];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (MOVE_DIRECTION)getMoveDirection:(TILE_POSITION)startPosition {
    switch (startPosition) {
        case TILE_TOP:
            return TOP_TO_RIGHT;
        case TILE_RIGHT:
            return RIGHT_TO_TOP;
        default:
            return MOVE_NONE;
    }
}

@end
