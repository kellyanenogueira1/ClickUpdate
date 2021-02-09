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
    Card(id: 2, image: "img3", title: "Peça ajuda rapidamente", description: "Em situações de emergência, você poderá pedir por ajuda de forma imediata."),
    Card(id: 3, image: "img3", title: "Dois cliques", description: "Com dois taps seguidos e rápidos, em qualquer lugar da tela inicial do app, você será capaz de ligar para pessoas de sua confiança imediatamente e enviá-las a sua localização por sms."),
    Card(id: 4, image: "img3", title: "Contate um amigo", description: "Adicione o número de dois amigos ao qual possa contatar em situações de risco. Em casos de o primeiro contato não atender, a chamada será encaminhada para o outro automaticamente."),
    Card(id: 5, image: "img3", title: "Pressione", description: "Ao pressionar durante 3 segundos em qualquer lugar da tela inicial deste app, você ligará para 190 e acionará a polícia para chegar ao local enviado por sms de forma automática."),
    Card(id: 6, image: "img3", title: "Atenção", description: "Em caso de dúvida, volte aos passos anteriores agora mesmo. Ao clicar em Entendi, você terá que reinstalar o app para ver as instruções novamente.")
]
