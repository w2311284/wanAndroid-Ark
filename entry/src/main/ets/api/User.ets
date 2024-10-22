import { Request } from '@yt/YtKit'
import { LoginFormModel, UserInfoModel } from '../models/User'

export const login = (params: LoginFormModel) => {
  return Request.post<UserInfoModel>('/user/login',params)
}