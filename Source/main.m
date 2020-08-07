//
//  main.m
//  comman
//
//  Created by bytedance on 7/20/20.
//

#import "Header.h"

@implementation xyzpeople


-(id)init{
    self = [super init];
    if(self){
        self.first_name = @ "Mengyu";
        self.last_name = @ "Yang";
    }
    
    return self;
}

-(void) saysomething:(NSString*) string{
    NSLog(@ "%@",string);
}

-(void) sayhello{
    //--stringWithFormat：字符串拼接方法--
    NSString* string = [NSString stringWithFormat: @ "Hello! %@ %@",self.first_name,self.last_name];
    [self saysomething: string];
}

+(xyzpeople*)person{
    return  [[self alloc]init];
}

-(void)measureweight:(NSInteger *)inputw{
    w = inputw;
}
-(void)measureheight:(NSInteger *)inputh{
    h = inputh;
}

-(void)dealloc{
    NSLog(@ "delloc...");
}
//--绑定 用这个方法来给只读变量赋值
@synthesize weight = w;
@synthesize height = h;


@end

@implementation xyzshoutingpeople

-(void) saysomething:(NSString *)string{
    string = [string uppercaseString];
    //--使用super方法，减少对子类的改动--
    [super saysomething:string];
}

+(xyzshoutingpeople*) person{
    return [[self alloc]init];
}

@end

    //--工厂类定义--
//@implementation people
//
//+(xyzpeople*) create_xyzpeople{
//    xyzpeople* instance = [[xyzpeople alloc]init];
//    return instance;
//}
//+(xyzshoutingpeople*) create_xyzshoutingpeople{
//    xyzshoutingpeople* instance = [[xyzshoutingpeople alloc]init];
//    return instance;
//}
//
//@end

//函数重载
@interface haveATry : NSObject

-(void)try1:(int) num1 another:(int) num2;
-(int)try1:(int) num1 another_num: (float) num2;

@end

@implementation haveATry

-(void)try1:(int)num1 another:(int)num2{
    NSLog(@ "ok");
}

-(int)try1:(int)num1 another_num:(float)num2{
    NSLog(@ "another");
    return 2;
}

@end



int main()
{
    //--继承类--
    xyzshoutingpeople *person_one = [[xyzshoutingpeople alloc]init];//嵌套
    xyzpeople *person_two = [[xyzpeople alloc]init];
    [person_one sayhello];
    [person_two sayhello];
    
    //工厂类
    xyzshoutingpeople *person_three = [xyzshoutingpeople person];
    xyzpeople *person_four = [xyzpeople person];
    [person_three saysomething:@ "three"];
    [person_four saysomething:@ "four"];
    
    //----nil---
    xyzpeople* pointer;
    if(pointer) NSLog(@ "not nil");
    else NSLog(@ "nil");
    
    
    //--readonly+sythesis--
    [person_two measureheight:(NSInteger*)100];
    [person_two measureweight:(NSInteger*)180];
    NSLog(@ "wight: %ld",(long)person_two.weight);
    NSLog(@ "height: %ld",(long)person_two.height);
    
//    person_two.weight = (NSInteger*)20;
    NSLog(@ "wight: %ld",(long)person_two.weight);
    
    haveATry *tryonce = [[haveATry alloc]init];
    [tryonce try1:10 another:20];
    [tryonce try1:10 another_num:10.2];
    
    return 0;
    
    
}


