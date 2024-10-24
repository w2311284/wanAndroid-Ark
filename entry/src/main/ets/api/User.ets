import { Request } from '@yt/YtKit'
import { LoginFormModel, User, UserInfoModel, UserModel } from '../models/User'

export const login = (params: LoginFormModel) => {
  return Request.post<UserInfoModel>('/user/login',params)
}

export const getUserInfo = () => {
  return Request.get<UserModel>('/user/lg/userinfo/json')
}