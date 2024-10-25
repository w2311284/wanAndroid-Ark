export class CollectArticleListDataModel {
  curPage : number = 0;
  datas : Array<CollectArticleItemModel> = [];
  total : number = 0;
  size : number = 0;
  pageCount : number = 0;
  offset : number = 0;
  over : boolean = false;
}

export class CollectArticleItemModel {
  author : string = "";
  chapterId : number = 0;
  chapterName : string = "";
  collect : boolean = true;
  courseId : number = 0;
  desc : string = "";
  envelopePic : string = "";
  id : number = 0;
  link : string = "";
  niceDate : string = "";
  origin : string = "";
  originId : number = 0;
  publishTime : number = 0;
  title : string = "";
  userId : number = 0;
  visible : number = 0;
  zan : number = 0;
}