#ifndef BEZIQUEHAND_H
#define BEZIQUEHAND_H
#include <QList>
#include <QQuickItem>

#include "card.h"

//using namespace std;

class BeziqueHand : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Card> cards READ getCards)
    Q_PROPERTY(QQmlListProperty<Card> meldedCards READ getMeldedCards)
    Q_PROPERTY(QQmlListProperty<Card> hiddedCards READ getHiddenCards)
public:
    friend class Player;

    static const int HAND_SIZE = 8;
    static const int CONVERT_FLUSH_INDEX = 3;
    static const int NOT_FOUND = -1;

    static const int SCORE_SEVEN = 10;
    static const int SCORE_MARRAGE = 20;
    static const int SCORE_ROYAL_MARRAGE = 40;
    static const int SCORE_FLUSH = 250;
    static const int SCORE_BEZIQUE = 40;
    static const int SCORE_DOUBLE_BEZIQUE = 500;
    static const int SCORE_ACE = 10;
    static const int SCORE_TEN = 10;
    static const int SCORE_LAST_TRICK = 10;
    static const int SCORE_FOURK_JACKS = 40;
    static const int SCORE_FOURK_QUEENS = 60;
    static const int SCORE_FOURK_KINGS = 80;
    static const int SCORE_FOURK_ACES = 100;

    BeziqueHand(QQuickItem *parent = 0);
    virtual ~BeziqueHand();

    void resetCards(QList<int> newHand);
    bool isEmpty() const;
    void addCard(int cardId);
    const Card *peek(int index);
    Card *playCard(int index, bool melded = false);
    int findLink(int index, bool melded = false);
    void refreshMelds(int trumps, bool seven);
    int meld(int index);

    QQmlListProperty<Card> getCards();
    QQmlListProperty<Card> getMeldedCards();
    QQmlListProperty<Card> getHiddenCards();

signals:
    void enginPlayedCard(int index);
public slots:
private:
    int findLinkHidden(int link) const;
    int findLinkMelded(int link) const;

    bool canMeld(int index, int trumps, bool seven) const;
    bool canMeldJack(int index, int trumps) const;
    bool canMeldQueen(int index, int trumps) const;
    bool canMeldKing(int index, int trumps) const;
    bool canMeldTen(int index, int trumps) const;
    bool canMeldAce(int index, int trumps) const;

    int findFlush(QList<int>& meld) const;
    int findBezique(QList<int>& meld) const;
    int findFourKind(QList<int>& meld) const;
    int findMarrage(QList<int>& meld) const;
    void moveMelded(const QList<int>& meld, int score);
    void moveHiddenMelded(int index);

    static void appendCard(QQmlListProperty<Card> *list, Card *card);
    static void appendMeldedCard(QQmlListProperty<Card> *list, Card *card);
    static void appendHiddenCard(QQmlListProperty<Card> *list, Card *card);
    QList<Card*> cards;
    QList<Card*> meldedCards;
    QList<Card*> hiddedCards;
};

#endif // BEZIQUEHAND_H













































