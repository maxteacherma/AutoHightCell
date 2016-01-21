//
//  ViewController.m
//  AutoTableViewCell
//
//  Created by macbook on 16/1/21.
//  Copyright © 2016年 DLD. All rights reserved.
//

#import "ViewController.h"
#import "AutoCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView * _tableView;
    
    NSArray * _dataTitleArray;
    NSArray * _dataDetailArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _dataDetailArray = [NSMutableArray array];
    _dataDetailArray =
    
    _dataTitleArray = @[@"内容1",@"内容2内容2内容2",@"内容3",@"内容4",@"内容5内容5",@"内容6",@"内容7",@"内容8内容8内容8",@"内容9",@"内容10内容10内容10内容10"];
    _dataDetailArray = @[@"生活如酒,或芳香,或浓烈,因为诚实,它变得醇厚；生活如歌,或高昂,或低沉,因为守信,它变得悦耳； 生活如画,或明丽,或素雅,因为诚信,它变得美丽.",@"若能掬起一捧月光,我选择最柔和的；若能采来香山红叶,我选择最艳丽的；若能摘下满天星辰,我选择最明亮的.也许你会说,我的选择不是最好,但我的选择,我相信.",@"当三闾大夫抱着石头与江水相拥,当西楚霸王自刎时的鲜血染红了整片夕阳,当普罗米修斯裸着身体被巨鹰啄食,当拉奥孔扭曲着身体仍想保卫自己的儿子,历史的悲风中发出阵阵悲鸣,但他们生命的结尾却那么响亮有力,数千年来仍叩击着人们的心灵,播放出永不低沉的生命绝唱!",@"人生弯弯曲曲水,世事重重叠叠山.热情去奔跑,去超越,然后才能拾掇失意后的坦然,挫折后的不屈,困苦艰难后的从容.",@"我们的成长要摆脱低俗事物的纷扰,用传统文化来滋养.有句话叫柔日读史,刚日读经.是说意志懈怠时读史以明志：谋臣策士,家国三寸簧舌里；金戈铁马,江山万里血泪中.读史书,能养浩然正气.也是指骄躁狂暴时读经以养性：老庄之道,清净无为是非空；菩提之心,灵台空明尘埃无.读经书,能塑静俭德性.我国浩瀚的书海之中,蕴含着无尽的宝藏,它们是我们成长真正的养分.",@"人们在同样的时间里奔跑,错过了桃花送走雪花春风唤醒田蛙的春,错过了浪花裂开心花荷盖展开青霞的夏,错过了稻禾沾满金露树木寄走一封封枯叶的秋,错过了山坡覆白雪水面凝银冰的冬.",@"宽容润滑了彼此的关系,消除了彼此的隔阂,扫清了彼此的顾忌,增进了彼此的了解.",@"温暖是飘飘洒洒的春雨；温暖是写在脸上的笑影；温暖是义无反顾的响应；温暖是一丝不苟的配合.",@"只有我们愿意打开心内的窗,才会看见心灵的宝藏；只有我们愿意打开心内的窗,才会看见门外清明的风景；只有我们愿意打开心内的窗,人间的繁花满树与灯火辉煌才会一片一片飘进窗来；只有我们愿意打开心内的窗,我们才能坦然勇敢走出门去,一步一步走向光明的所在.",@"有了执著,生命旅程上的寂寞可以铺成一片蓝天；有了执著,孤单可以演绎成一排鸿雁；有了执著,欢乐可以绽放成满圆的鲜花."];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataDetailArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    AutoCell * cell = [[AutoCell alloc]init];
    return [cell cellHeightWithArray:@[_dataTitleArray[indexPath.row],_dataDetailArray[indexPath.row]]]+30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AutoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"autoCell"];
    if (cell == nil) {
        cell = [[AutoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"autoCell"];
    }
    cell.array = @[_dataTitleArray[indexPath.row],_dataDetailArray[indexPath.row]];
    return cell;
}

@end
