import { Request } from '@yt/YtKit'
import { CoinListDataModel } from '../models/Coin'
import { LoginFormModel, User, UserInfoModel, UserModel } from '../models/User'

export const login = (params: LoginFormModel) => {
  return Request.post<UserInfoModel>('/user/login',params)
}

export const getUserInfo = () => {
  return Request.get<UserModel>('/user/lg/userinfo/json')
}

export const getCoinDataList = (page: number) => {
  return Request.get<CoinListDataModel>(`/lg/coin/list/${page}/json?page_size=20`)
}