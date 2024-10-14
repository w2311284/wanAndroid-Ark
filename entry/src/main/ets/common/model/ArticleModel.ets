export default class Article{

  apkLink : string = "";
  audit : number = 0;
  author : string = "";
  canEdit : boolean = false;
  chapterId : number = 0;
  chapterName : string = "";
  collect : boolean = false;
  courseId : number = 0;
  desc : string = "";
  descMd : string = "";
  envelopePic : string = "";
  fresh : boolean = false;
  host : string = "";
  id : number = 0;
  link : string = "";
  niceDate : string = "";
  niceShareDate : string = "";
  origin : string = "";
  prefix : string = "";
  projectLink : string = "";
  publishTime : number = 0;
  realSuperChapterId : number = 0;
  selfVisible : number = 0;
  shareDate : number = 0;
  shareUser : string = "";
  superChapterId : number = 0;
  superChapterName : string = "";
  tags : Array<Tag> = [];
  title : string = "";
  type : number = 0;
  userId : number = 0;
  visible : number = 0;
  zan : number = 0;

  isTopic: boolean = false;

}

export class Tag{
  name : string = '';
  url : string = '';
}

export  function  mockArticle(): Article {
  let item = new Article()
  item.author = "mark zhang"
  item.title = "测试模拟数据，mock的 哈哈哈"
  let tag:Tag = new Tag()
  tag.name = "mock 广场"
  item.tags = [tag]
  item.niceDate = "2024-09-11"
  return item;
}