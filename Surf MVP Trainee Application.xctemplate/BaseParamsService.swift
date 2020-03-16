//
//  BaseParamsService.swift
//  TestProject
//
//  Created by Vladislav Krupenko on 16.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import Foundation

enum BaseParamsService {

    // MARK: - Keys

    private enum Keys {
        static let token = "token"
        static let bundleId = "bundleId"
        static let debug = "debug"
        static let version = "version"
        static let build = "build"
        static let imageSize = "imageSize"
        static let timeZone = "timeZone"
        static let sig = "sig"
    }

    // MARK: - Properties

    static var baseURL: URL? {
        // TODO: Необходимо заменить на метод, который будет получать версию приложения
        let currentVersion = "1.2.3"
        return URL(string: "\(ServiceConstants.baseUrl)/v\(currentVersion)")
    }

    // MARK: - Internal Properties

    static func getBaseParameters(parameters: [String: Any]) -> [String: Any] {
        // TODO: Заменить на получение токена из другого сервиса
        let token = ""

        var extensionParameters = getExtensionParameters()
        parameters.forEach { (k, v) in extensionParameters[k] = v}

        let keys = Array(extensionParameters.keys)
        let sortedKeys = keys.sorted { $0.caseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        let objects = sortedKeys.map { extensionParameters[$0] }

        var sortedParamsString = ""
        for i in 0..<sortedKeys.count {
            let object = objects[i]
            var objectString: String?

            switch object {
            case let objectDictionary as [String: Any]:
                if let jsonData = try? JSONSerialization.data(withJSONObject: objectDictionary, options: []) {
                    objectString = String(data: jsonData, encoding: String.Encoding.utf8)
                }
            case let objectArray as [Any]:
                if let jsonData = try? JSONSerialization.data(withJSONObject: objectArray, options: []) {
                    objectString = String(data: jsonData, encoding: String.Encoding.utf8)
                }
            case let object as String:
                objectString = object
            default:
                break
            }

            sortedParamsString = "\(sortedParamsString)\(sortedKeys[i])\(objectString ?? "")"
        }

        sortedParamsString = "\(token)\(sortedParamsString)\(ServiceConstants.privateKey)"
        extensionParameters[Keys.sig] = sortedParamsString.md5()
        return extensionParameters
    }

}

// MARK: - Help Methods

private extension BaseParamsService {

    static func getExtensionParameters() -> [String: Any] {
        // TODO: Необходимо заменить на методы, которые будут возвращать значения из проекта
        // Стоит спросить у ментора, какие текущие версии и билды поддерживаются сервером
        // Также необходимо написать метод получения размера картинки
        let version = "1.2.3"
        let build = "123"
        let imageSize = "1"

        let extensionParamters: [String: Any] = [
            // TODO: Необходимо получать токен от сервера, сохранять и получать его, если его нет, то стринга пустая
            Keys.token: "",
            Keys.bundleId: ServiceConstants.bundleId,
            Keys.debug: "true",
            Keys.version: version,
            Keys.build: build,
            Keys.imageSize: imageSize,
            Keys.timeZone: getCurrentTimeZone()
        ]

        return extensionParamters
    }

    static func getCurrentTimeZone() -> String {
        let timeZoneOffset = Double(NSTimeZone.system.secondsFromGMT()) / 3600.0
        var timeZoneString = String(format: "%ld", Int64(timeZoneOffset))

        if timeZoneOffset > 0 {
            timeZoneString = String(format: "+%ld", Int64(timeZoneOffset))
        } else if timeZoneOffset < 0 {
            timeZoneString = String(format: "%ld", Int64(timeZoneOffset))
        }

        return timeZoneString
    }

}
