import { CoinInfo } from './Coin'

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
  coinInfo: CoinInfo,
  userInfo: UserInfo
}

export class UserModel implements User {
  coinInfo: CoinInfo
  userInfo: UserInfo

  constructor(user: User) {
    this.coinInfo = user.coinInfo
    this.userInfo = user.userInfo
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