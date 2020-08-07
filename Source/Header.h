//
//  Header.h
//  comman
//
//  Created by bytedance on 7/21/20.
//

#import <foundation/foundation.h>

#ifndef Header_h
#define Header_h


@interface xyzpeople : NSObject{
    NSInteger* h;
    NSInteger* w;
}

@property() NSString* first_name;
@property() NSString* last_name;
@property() NSDate* birthday;
@property(readonly) NSInteger* height;
@property(readonly) NSInteger* weight;


-(id)init;
-(void) saysomething:(NSString*) string;
-(void) sayhello;
-(void) dealloc;
-(void) measureweight:(NSInteger*) inputw;
-(void) measureheight:(NSInteger*) inputh;
+(xyzpeople*) person;

@end

@interface xyzshoutingpeople : xyzpeople

-(void) saysomething:(NSString *)string;
+(xyzshoutingpeople*) person;

@end

//@interface people : NSObject
//
//+(xyzpeople*) create_xyzpeople;
//+(xyzshoutingpeople*) create_xyzshoutingpeople;
//
//@end

#endif /* Header_h */
