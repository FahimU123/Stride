//
//  Test.swift
//  Stride
//
//  Created by Fahim Uddin on 10/3/24.
//

import SwiftUI

struct Quote: View {
    let quoteOfTheDay = ["Believe you can and you're halfway there. - Theodore Roosevelt", "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill", "Don't watch the clock; do what it does. Keep going. - Sam Levenson", "The only way to do great work is to love what you do.  Steve Jobs", "The harder you work for something, the greater you'll feel when you achieve it. - Anonymous", "Your limitation—it's only your imagination. - Anonymous", "The best way to get started is to quit talking and begin doing.- Walt Disney", "Dream it. Wish it. Do it. - Anonymous", "Success doesn’t just find you. You have to go out and get it. - Anonymous", "The secret of getting ahead is getting started - Mark Twain"]
    var body: some View {
        Text(quoteOfTheDay.randomElement()!)
    }
}

#Preview {
    Quote()
}
