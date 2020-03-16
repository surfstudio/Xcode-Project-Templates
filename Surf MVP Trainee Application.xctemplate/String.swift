//
//  String.swift
//  TestProject
//
//  Created by Vladislav Krupenko on 16.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import Foundation
import CommonCrypto

// MARK: - MD5

extension String {

    func md5() -> String {

        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest: [UInt8] = Array(repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, self, CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate()
        var hexString = ""
        for byte in digest {
            hexString += String(format: "%02x", byte)
        }

        return hexString
    }

}
