export interface Coin {
  coinCount: number
  desc: string
  reason: string
}

export class CoinModel implements Coin {
  coinCount: number
  desc: string
  reason: string

  constructor(coin: Coin) {
    this.coinCount = coin.coinCount
    this.desc = coin.desc
    this.reason = coin.reason
  }
}

export interface CoinListData {
  curPage : number
  datas : Array<CoinModel>
  total : number
  size : number
  pageCount : number
  offset : number
  over : boolean
}

export class CoinListDataModel implements CoinListData {
  curPage : number = 0;
  datas : Array<CoinModel> = [];
  total : number = 0;
  size : number = 0;
  pageCount : number = 0;
  offset : number = 0;
  over : boolean = false;

  constructor(coin: CoinListData) {
    this.curPage = coin.curPage
    this.datas = coin.datas
    this.total = coin.total
    this.size = coin.size
    this.pageCount = coin.pageCount
    this.offset = coin.offset
    this.over = coin.over
  }
}