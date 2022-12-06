//
//  AsyncService.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 05/12/2022.
//

//import Foundation
//
//class AsyncService {
//
////                   DispatchQueue.main.async {
////                       completion(.success(result))
////
////                   }
////               } else {
////                   completion(.failure(.decodingError))
////               }
//                   
//    func redirectTo2ndURL () {
//                       
//    }
//    
//    func listeningToLoginEndopint () {
//        
//    }
//    
//    public func register(request: HTTPRequest, response: HTTPResponse) {
//        do {
//            let registerUserDto = try request.getObjectFromRequest(RegisterUserDto.self)
//            let user = registerUserDto.toUser()
//
//            try self.usersService.add(entity: user)
//
//            guard let registeredUser = try self.usersService.get(byId: user.id) else {
//                return response.sendNotFoundError()
//            }
//
//            let registeredUserDto = UserDto(user: registeredUser)
//            return response.sendJson(registeredUserDto)
//        }
//        catch let error where error is DecodingError || error is RequestError {
//            response.sendBadRequestError()
//        }
//        catch let error as ValidationsError {
//            response.sendValidationsError(error: error)
//        }
//        catch {
//            response.sendInternalServerError(error: error)
//        }
//    }
//    
//    
//    public func generateHash(salt: String) throws -> String {
//        let stringWithSalt = salt + self
//
//        guard let stringArray = stringWithSalt.digest(.sha256)?.encode(.base64) else {
//            throw GeneratePasswordError()
//        }
//
//        guard let stringHash = String(data: Data(bytes: stringArray, count: stringArray.count), encoding: .utf8) else {
//            throw GeneratePasswordError()
//        }
//
//        return stringHash
//    }
//    
//    public func signIn(request: HTTPRequest, response: HTTPResponse) {
//        do {
//            let signIn = try request.getObjectFromRequest(SignInDto.self)
//
//            guard let user = try self.usersService.get(byEmail: signIn.email) else {
//                return response.sendNotFoundError()
//            }
//
//            let password = try signIn.password.generateHash(salt: user.salt)
//            if password != user.password {
//                return response.sendNotFoundError()
//            }
//
//            let tokenDto = try self.prepareToken(user: user)
//            return response.sendJson(tokenDto)
//        }
//        catch let error where error is DecodingError || error is RequestError {
//            response.sendBadRequestError()
//        }
//        catch let error as ValidationsError {
//            response.sendValidationsError(error: error)
//        }
//        catch {
//            response.sendInternalServerError(error: error)
//        }
//    }
//}
