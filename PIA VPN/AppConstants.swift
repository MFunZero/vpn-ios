//
//  AppConstants.swift
//  PIA VPN
//
//  Created by Davide De Rosa on 12/16/17.
//  Copyright © 2020 Private Internet Access, Inc.
//
//  This file is part of the Private Internet Access iOS Client.
//
//  The Private Internet Access iOS Client is free software: you can redistribute it and/or
//  modify it under the terms of the GNU General Public License as published by the Free
//  Software Foundation, either version 3 of the License, or (at your option) any later version.
//
//  The Private Internet Access iOS Client is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
//  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
//  details.
//
//  You should have received a copy of the GNU General Public License along with the Private
//  Internet Access iOS Client.  If not, see <https://www.gnu.org/licenses/>.
//

import Foundation
import PIALibrary

struct AppConstants {
    
    static let appId = "955626407"
    static let teamId = "5357M5NW9W"

    static let appGroup = "group.com.privateinternetaccess"
    
    static let appCenterAppId = "a2397c42-40ac-48e8-97e6-7498f0df0e1a"
    
    struct Reviews {
        static var appReviewUrl = "https://itunes.apple.com/app/id\(appId)?action=write-review"
        static var feedbackUrl = "https://www.privateinternetaccess.com/helpdesk/new-ticket"
    }
    
    struct Flags {
        static var developmentPath = Bundle.main.path(forResource: "Flags-dev", ofType: "plist")
    }

    struct About {
        static var componentsPath = Bundle.main.path(forResource: "Components", ofType: "plist")
    }
    
    struct Regions {
        static var bundleURL = Bundle.main.url(forResource: "Regions", withExtension: "json")
    }

    struct InApp {
        static let yearlyProductIdentifier = "com.privateinternetaccess.subscription.1year.2020"
        static let monthlyProductIdentifier = "com.privateinternetaccess.subscription.1month.2020"
    }
    
    struct LegacyInApp {
        static let yearlySubscriptionProductIdentifier = "com.privateinternetaccess.subscription.1year"
        static let monthlySubscriptionProductIdentifier = "com.privateinternetaccess.subscription.1month"
        static let yearlyProductIdentifier = "com.privateinternetaccess.ios.iap.2019.1year"
        static let monthlyProductIdentifier = "com.privateinternetaccess.ios.iap.2019.1month"
        static let oldYearlyProductIdentifier = "com.privateinternetaccess.ios.iap.1year"
        static let oldMonthlyProductIdentifier = "com.privateinternetaccess.ios.iap.1month"
    }
    
    struct AppURL {
        static let hostRegion = "region"
    }
    
    struct Extensions {
        static let tunnelBundleIdentifier = "com.privateinternetaccess.ios.PIA-VPN.Tunnel"
        static let tunnelWireguardBundleIdentifier = "com.privateinternetaccess.ios.PIA-VPN.WG-Tunnel"

        static let adBlockerBundleIdentifier = "com.privateinternetaccess.ios.PIA-VPN.AdBlocker"
    }
    
    struct SiriShortcuts {
        static let shortcutConnect = "com.privateinternetaccess.ios.PIA-VPN.connect"
        static let shortcutDisconnect = "com.privateinternetaccess.ios.PIA-VPN.disconnect"
    }
    
    struct Web {
        static let homeURL = URL(string: "https://www.privateinternetaccess.com/")!

        static let supportURL = URL(string: "https://www.privateinternetaccess.com/helpdesk")!
        
        static let privacyURL = URL(string: "https://www.privateinternetaccess.com/pages/privacy-policy/")!

        static let csEmail = "helpdesk+vpnpermissions.ios@privateinternetaccess.com"
        
        static let friendReferralTerms = "https://www.privateinternetaccess.com/pages/invites/terms_and_conditions"

        static var stagingEndpointURL: URL? = {
            guard let path = Bundle.main.path(forResource: "staging", ofType: "endpoint") else {
                return nil
            }
            guard let content = try? String(contentsOfFile: path) else {
                return nil
            }
            return URL(string: content.trimmingCharacters(in: .whitespacesAndNewlines))
        }()
    }
    
    struct Servers {
        static var customServers: [Server]? = {
            guard let path = Bundle.main.path(forResource: "custom", ofType: "servers") else {
                return nil
            }
            guard let content = try? String(contentsOfFile: path) else {
                return nil
            }

            var servers: [Server] = []
            let lines = content.components(separatedBy: "\n")
            for line in lines {
                let tokens = line.components(separatedBy: ":")
                guard tokens.count == 6 else {
                    continue
                }
                
                let name = tokens[0]
                let country = tokens[1]
                let hostname = tokens[2]
                let address = tokens[3]
                
                guard let udpPort = UInt16(tokens[4]) else {
                    continue
                }
                guard let tcpPort = UInt16(tokens[5]) else {
                    continue
                }

                servers.append(Server(
                    serial: "",
                    name: name,
                    country: country,
                    hostname: hostname,
                    bestOpenVPNAddressForTCP: Server.Address(hostname: address, port: tcpPort),
                    bestOpenVPNAddressForUDP: Server.Address(hostname: address, port: udpPort),
                    pingAddress: nil
                ))
            }
            return servers
        }()
    }
    
    struct Fonts {
        static let typeface: Theme.Typeface = {
            let typeface = Theme.Typeface()
            typeface.regularName = "Roboto-Regular"
            typeface.mediumName = "Roboto-Medium"
            return typeface
        }()
    }
    
    struct VPNWidget {
        static let vpnStatus = "vpn.status"
        static let vpnButtonDescription = "vpn.button.description"
    }
    
    struct AppleUrls {
        static let subscriptions = "itms-apps://apps.apple.com/account/subscriptions"
    }
    
    struct Browser {
        static let browserAppId = "598907571"
        static let scheme = "inbrowser://?www.privateinternetaccess.com"
        static let appStoreUrl = "itms-apps://itunes.apple.com/app/id598907571"
        static let safariUrl = "https://apps.apple.com/us/app/inbrowser-private-browsing/id598907571?ls=1"
    }
    
    struct OpenVPNPacketSize {
        static let defaultPacketSize = 1400
        static let smallPacketSize = 1350
    }
    
    struct ServerCoordinates {
        static let defaultCoordinates = ["lat": 40.463667, "long": -3.74922]
        static let coordinates = [
            "UAE": ["lat": 23.424076, "long": 53.847818],
            "Albania": ["lat": 41.33165, "long": 19.8318],
            "Argentina": ["lat": -38.416096, "long": -63.616673],
            "AU Sydney": ["lat": -33.868820, "long": 151.209296],
            "AU Melbourne": ["lat": -37.813628, "long": 144.963058],
            "AU Perth": ["lat": -31.950527, "long": 115.860458],
            "Austria": ["lat": 47.516231, "long": 14.550072],
            "Bosnia and Herzegovina": ["lat": 43.858181, "long": 18.412340],
            "Belgium": ["lat": 50.503887, "long": 4.469936],
            "Bulgaria": ["lat": 42.655033, "long": 25.231817],
            "Brazil": ["lat": -14.235004, "long": -51.92528],
            "CA Montreal": ["lat": 45.501689, "long": -73.567256],
            "CA Ontario": ["lat": 51.253777, "long": -85.232212],
            "CA Toronto": ["lat": 43.653226, "long": -79.383184],
            "CA Vancouver": ["lat": 49.282729, "long": -123.120738],
            "Czech Republic": ["lat": 50.075538, "long": 14.4378],
            "DE Berlin": ["lat": 52.520007, "long": 13.404954],
            "Denmark": ["lat": 56.263920, "long": 9.501785],
            "Estonia": ["lat": 59.436962, "long": 24.753574],
            "Finland": ["lat": 61.924110, "long": 25.748151],
            "France": ["lat": 46.227638, "long": 2.213749],
            "DE Frankfurt": ["lat": 50.110922, "long": 8.682127],
            "Greece": ["lat": 37.983810, "long": 23.727539],
            "Hong Kong": ["lat": 22.396428, "long": 114.109497],
            "Croatia": ["lat": 45.815399, "long": 15.966568],
            "Hungary": ["lat": 47.162494, "long": 19.503304],
            "India": ["lat": 20.593684, "long": 78.96288],
            "Ireland": ["lat": 53.142367, "long": -7.692054],
            "Iceland": ["lat": 64.852829, "long": -18.301501],
            "Israel": ["lat": 31.046051, "long": 34.851612],
            "Italy": ["lat": 41.871940, "long": 12.56738],
            "Japan": ["lat": 36.204824, "long": 138.252924],
            "Lithuania": ["lat": 54.687157, "long": 25.279652],
            "Luxembourg": ["lat": 49.815273, "long": 6.129583],
            "Latvia": ["lat": 56.946285, "long": 24.105078],
            "Moldova": ["lat": 47.265819, "long": 28.598334],
            "Mexico": ["lat": 23.634501, "long": -102.552784],
            "North Macedonia": ["lat": 41.608635, "long": 21.745275],
            "Malaysia": ["lat": 3.140853, "long": 101.693207],
            "Netherlands": ["lat": 52.132633, "long": 5.291266],
            "Norway": ["lat": 60.472024, "long": 8.468946],
            "New Zealand": ["lat": -40.900557, "long": 174.885971],
            "Poland": ["lat": 51.919438, "long": 19.145136],
            "Portugal": ["lat": 38.736946, "long": -9.142685],
            "Romania": ["lat": 45.943161, "long": 24.96676],
            "Serbia": ["lat": 44.016421, "long": 21.005859],
            "Singapore": ["lat": 1.352083, "long": 103.819836],
            "Slovenia": ["lat": 46.075219, "long": 14.882733],
            "Slovakia": ["lat": 48.148598, "long": 17.107748],
            "Spain": ["lat": 40.463667, "long": -3.74922],
            "Sweden": ["lat": 60.128161, "long": 18.643501],
            "Switzerland": ["lat": 46.818188, "long": 8.227512],
            "Turkey": ["lat": 38.963745, "long": 35.243322],
            "Ukraine": ["lat": 48.379433, "long": 31.165581],
            "UK London": ["lat": 51.507351, "long": -0.127758],
            "UK Manchester": ["lat": 53.480759, "long": -2.242631],
            "UK Southampton": ["lat": 50.909700, "long": -1.404351],
            "US East": ["lat": 36.414652, "long": -77.739258],
            "US West": ["lat": 40.607697, "long": -120.805664],
            "US Atlanta": ["lat": 33.748995, "long": -84.387982],
            "US California": ["lat": 36.778261, "long": -119.417932],
            "US Chicago": ["lat": 41.878114, "long": -87.629798],
            "US Denver": ["lat": 39.739236, "long": -104.990251],
            "US Florida": ["lat": 27.664827, "long": -81.515754],
            "US Houston": ["lat": 29.760427, "long": -95.369803],
            "US Las Vegas": ["lat": 36.169941, "long": -115.13983],
            "US New York City": ["lat": 40.712775, "long": -74.005973],
            "US Seattle": ["lat": 47.606209, "long": -122.332071],
            "US Silicon Valley": ["lat": 37.593392, "long": -122.04383],
            "US Texas": ["lat": 33.623962, "long": -109.654814],
            "US Washington DC": ["lat": 38.907192, "long": -77.036871],
            "South Africa": ["lat": -30.559482, "long": 22.937506]
        ]
    }

}
