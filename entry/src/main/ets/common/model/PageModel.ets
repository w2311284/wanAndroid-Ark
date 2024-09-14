import Article from './ArticleModel';

export default class Page {
  curPage : number = 0;
  datas : Array<Article> = [];
  total : number = 0;
  size : number = 0;
  pageCount : number = 0;
  offset : number = 0;
  over : boolean = false;
}