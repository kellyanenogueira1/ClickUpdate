//
//  Card.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 06/02/21.
//

import Foundation

struct Card: Identifiable {
    var id: Int
    var image: String
    var title: String
    var description: String
}

var allCards: [Card] = [
    Card(id: 1, image: "img3", title: "Só você verá estas instruções", description: "Para sua segurança, esses procedimentos só serão feitos uma única vez. Prossiga com atenção."),
    Card(id: 2, image: "img3", title: "Adicione um contato de emergência", description: "Você será capaz de ligar para este contato rapidamente."),
    Card(id: 3, image: "discretCircle", title: "Peça ajuda", description: "Na tela inicial, com dois taps: Disque seu contato de emergência. Ao pressionar durante 3 segundos: Disque 190. Sua localização será enviada por sms."),
    Card(id: 4, image: "img3", title: "Atenção", description: "Em caso de dúvida, volte aos passos anteriores agora mesmo. Ao clicar em Entendi, você terá que reinstalar o app para ver as instruções novamente.")
]
