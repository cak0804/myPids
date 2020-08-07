////
////  withPro.m
////  comman
////
////  Created by bytedance on 7/22/20.
////
//
//#import "pro.h"
//
//@interface withPro1 : NSObject<pro>
//
//@property(strong)NSString* strong;
//@property(weak)NSString* weak;
//-(id)init:(NSString*) strongStr anontherStr:(NSString*) weakStr;
//
//@end
//
//
//@implementation withPro1
//
//-(id)init:(NSString *)strongStr anontherStr:(NSString *)weakStr{
//    self = [super init];
//    _strong = strongStr;
//    _weak = weakStr;
//    return self;
//    
//}
//
//-(void)sayok{
//    NSString* output = [NSString stringWithFormat:@ "%@ %@",_strong,_weak];
//    NSLog(@ "%@",output);
//}
//
//@end
//
//int main(){
//    withPro1 *example = [[withPro1 alloc]init:@ "hello" anontherStr:@ "girls!"];
//    [example sayok];
//    return 0;
//}
//
//
//
