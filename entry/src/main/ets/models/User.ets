export interface LoginForm {
  username: string
  password: string
}

export class LoginFormModel implements LoginForm {
  username: string = ''
  password: string = ''

  constructor(model: LoginForm) {
    this.username = model.username
    this.password = model.password
  }
}

export interface User {
  coinInfo: CoinInfoModel,
  userInfo: UserInfoModel
}

export class UserModel implements User {
  coinInfo: CoinInfoModel
  userInfo: UserInfoModel

  constructor(user: User) {
    this.coinInfo = user.coinInfo
    this.userInfo = user.userInfo
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

export interface CollectArticleInfo {
  count: number
}

export class CollectArticleInfoModel implements CollectArticleInfo {
  count: number

  constructor(model: CollectArticleInfo) {
    this.count = model.count
  }
}

export interface UserInfo {
  admin: boolean
  chapterTops: []
  coinCount: number
  collectIds: []
  email: string
  icon: string
  id: number
  nickname: string
  password: string
  publicName: string
  token: string
  type: number
  username: string
}

export class UserInfoModel implements UserInfo {
  admin: boolean
  chapterTops: []
  coinCount: number
  collectIds: []
  email: string
  icon: string
  id: number
  nickname: string
  password: string
  publicName: string
  token: string
  type: number
  username: string

  constructor(model: UserInfo) {
    this.admin = model.admin
    this.chapterTops = model.chapterTops
    this.coinCount = model.coinCount
    this.collectIds = model.collectIds
    this.email = model.email
    this.icon = model.icon
    this.id = model.id
    this.nickname = model.nickname
    this.password = model.password
    this.token = model.token
    this.publicName = model.publicName
    this.type = model.type
    this.username = model.username
  }
}