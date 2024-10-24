export interface MyCoin {
  coinCount: number
  desc: string
  reason: string
  username: string
}

export class MyCoinModel implements MyCoin {
  coinCount: number
  desc: string
  reason: string
  username: string
  constructor(coin: MyCoin) {
    this.coinCount = coin.coinCount
    this.desc = coin.desc
    this.reason = coin.reason
    this.username = coin.username
  }
}

export interface CoinListData {
  curPage : number
  datas : Array<MyCoinModel>
  total : number
  size : number
  pageCount : number
  offset : number
  over : boolean
}

export class CoinListDataModel implements CoinListData {
  curPage : number = 0;
  datas : Array<MyCoinModel> = [];
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

export interface CoinInfo {
  coinCount: number
  level: number
  nickname: string
  rank: string
  userId: number
  username: string
}

export class CoinInfoModel implements CoinInfo {
  coinCount: number
  level: number
  nickname: string
  rank: string
  userId: number
  username: string

  constructor(model: CoinInfo) {
    this.coinCount = model.coinCount
    this.level = model.level
    this.nickname = model.nickname
    this.rank = model.rank
    this.userId = model.userId
    this.username = model.username
  }
}