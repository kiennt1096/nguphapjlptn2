import '../core.dart';

class ChapterServices {
  List<Chapter> getChapterList() {
    return <Chapter>[
      Chapter(
        1,
        [
          Grammar(id: 1, nameJP: "げ", nameVN: "Trông có vẻ..."),
          Grammar(id: 2, nameJP: "とか", nameVN: "Thấy bảo hình như là..."),
          Grammar(id: 3, nameJP: "ていく/~てくる", nameVN: "Nhiều nghĩa"),
          Grammar(id: 4, nameJP: "がたい", nameVN: "Khó.../ Không thể..."),
          Grammar(
              id: 5, nameJP: "かと思うと", nameVN: "Vừa mới... đã ngay lập tức..."),
          Grammar(
              id: 6, nameJP: "か~かのうちに", nameVN: "Ngay khi vừa mới ... thì..."),
        ],
      ),
      Chapter(
        2,
        [
          Grammar(id: 7, nameJP: "だけあって", nameVN: "Quả nhiên là vì ... nên"),
          Grammar(id: 8, nameJP: "だけに", nameVN: "Chính bởi... "),
          Grammar(id: 9, nameJP: "ばこそ", nameVN: "Chính vì... nên mới..."),
          Grammar(id: 10, nameJP: "ばかりに", nameVN: "Chỉ vì... mà..."),
        ],
      ),
      Chapter(
        3,
        [
          Grammar(
              id: 11, nameJP: "ものだ", nameVN: "Vốn dĩ là.../Là đương nhiên... "),
          Grammar(id: 12, nameJP: "ものだ/ものではない", nameVN: "Nên/ Không nên…"),
          Grammar(id: 13, nameJP: "ものだ", nameVN: "Thật là...biết bao"),
          Grammar(id: 14, nameJP: "というものだ", nameVN: "Thật là, đúng là…"),
        ],
      ),
      Chapter(
        4,
        [
          Grammar(id: 15, nameJP: "ものの", nameVN: "Mặc dù...nhưng/...thế mà"),
          Grammar(id: 16, nameJP: "ものなら", nameVN: "Nếu như có thể…"),
          Grammar(
              id: 17,
              nameJP: "というものではない",
              nameVN: "Tôi nghĩ rằng không hẳn là…"),
          Grammar(
              id: 18, nameJP: "ものがある", nameVN: "Có điều gì đó cảm thấy rất…"),
        ],
      ),
      Chapter(
        5,
        [
          Grammar(
              id: 19,
              nameJP: "ことになる/ことになっている",
              nameVN: "Đã được quyết định,…/ Kết quả là…"),
          Grammar(id: 20, nameJP: "ことなく", nameVN: "Mà không …"),
          Grammar(
              id: 21,
              nameJP: "ことに",
              nameVN: "Thật là .../ Thật...làm sao/ Biết bao khi…"),
          Grammar(id: 22, nameJP: "ことから", nameVN: "Vì là có việc.../ Bởi…"),
          Grammar(id: 23, nameJP: "ことだから", nameVN: "Vì là... nên chắc chắn"),
          Grammar(id: 24, nameJP: "ことには", nameVN: "Nếu không ... thì…"),
        ],
      ),
      Chapter(
        6,
        [
          Grammar(id: 25, nameJP: "ことはない", nameVN: "Không cần phải "),
          Grammar(
              id: 26, nameJP: "こと(命令)", nameVN: "Hãy, phải.../ Không được…"),
          Grammar(
              id: 27, nameJP: "ことだ", nameVN: "Nên/ Không nên / vô cùng, rất"),
          Grammar(id: 28, nameJP: "ことか", nameVN: "Vô cùng/ rất "),
          Grammar(id: 29, nameJP: "ないことはない", nameVN: "Không phải là không…"),
          Grammar(id: 30, nameJP: "ことだし", nameVN: "Vì, bởi vì … nên"),
        ],
      ),
      Chapter(
        7,
        [
          Grammar(
              id: 31, nameJP: "限り(では)", nameVN: "Trong phạm vi.../ Ở mức độ…"),
          Grammar(id: 32, nameJP: "限り(は)", nameVN: "Trong lúc.../ Khi…"),
          Grammar(
              id: 33,
              nameJP: "に限り/に限る",
              nameVN: "Chỉ trong/ Chỉ đối với/ Chỉ riêng"),
          Grammar(id: 34, nameJP: "に限らず", nameVN: "Không chỉ ... mà còn …"),
          Grammar(
              id: 35, nameJP: "に限って", nameVN: "Ai chứ, gì chứ / Đúng vào lúc"),
          Grammar(id: 36, nameJP: "に限る", nameVN: "~ là tốt nhất"),
          Grammar(id: 37, nameJP: "かぎりだ", nameVN: "Cảm thấy rất/ vô cùng ~"),
        ],
      ),
      Chapter(
        8,
        [
          Grammar(id: 38, nameJP: "まい", nameVN: "Sẽ không/Có lẽ không"),
          Grammar(id: 39, nameJP: "ようか〜まいか", nameVN: "Làm ... hay là không …"),
          Grammar(id: 40, nameJP: "にしろ~にしろ", nameVN: "Dù...dù…"),
          Grammar(
              id: 41, nameJP: "にせよ~にせよ", nameVN: "Cho dù, dù cho, ngay cả.."),
          Grammar(id: 42, nameJP: "にかかわらず", nameVN: "Bất kể…"),
          Grammar(
              id: 43,
              nameJP: "にもかかわらず",
              nameVN: "Mặc dù.../ Cho dù.../ Không quản…"),
        ],
      ),
      Chapter(
        9,
        [
          Grammar(
              id: 44,
              nameJP: "につけ",
              nameVN: "Cứ mỗi khi.../ Lúc nào cũng, cái gì cũng…"),
          Grammar(
              id: 45, nameJP: "に反して", nameVN: "Trái với.../ Ngược lại với…"),
          Grammar(
              id: 46, nameJP: "に応じて", nameVN: "Tùy theo.../ Tương ứng với..."),
          Grammar(
              id: 47,
              nameJP: "に加えて",
              nameVN: "Thêm vào đó nữa là.../ Không chỉ... mà... cũng…"),
          Grammar(id: 48, nameJP: "につき", nameVN: "Cứ mỗi/Vì, do"),
        ],
      ),
      Chapter(
        10,
        [
          Grammar(id: 49, nameJP: "に基づいて", nameVN: "Dựa theo.../ Dựa trên…"),
          Grammar(
              id: 50,
              nameJP: "にしたがって",
              nameVN: "tuân theo, theo đúng/ càng … càng"),
          Grammar(id: 51, nameJP: "際・に際して", nameVN: "Khi, nhân dịp...)"),
          Grammar(id: 52, nameJP: "にあたって", nameVN: "Khi/ Nhân dịp…"),
          Grammar(id: 53, nameJP: "にそって", nameVN: "dọc theo/dựa theo "),
        ],
      ),
      Chapter(
        11,
        [
          Grammar(
              id: 54,
              nameJP: "にともなって",
              nameVN: "càng...càng; cùng với/vì ... Nên"),
          Grammar(
              id: 55, nameJP: "にかけては", nameVN: "Riêng về mặt..., lĩnh vực…"),
          Grammar(id: 56, nameJP: "にしては", nameVN: "Vậy mà…"),
          Grammar(id: 57, nameJP: "にしても", nameVN: "Giả sử, cứ cho là...thì…"),
          Grammar(id: 58, nameJP: "(に)もかまわず", nameVN: "Mặc kệ.../ Chẳng màng…"),
        ],
      ),
      Chapter(
        12,
        [
          Grammar(id: 59, nameJP: "を込めて", nameVN: "Chất chứa.../ Dồn cả…"),
          Grammar(
              id: 60,
              nameJP: "をぬきにして(は)",
              nameVN: "Nếu mà không...thì khó có thể…"),
          Grammar(id: 61, nameJP: "を問わず", nameVN: "Bất kể…"),
          Grammar(
              id: 62,
              nameJP: "をはじめ",
              nameVN: "Điều đầu tiên kể đến là.../ Đặc biệt là…"),
          Grammar(id: 63, nameJP: "をめぐって", nameVN: "Xoay xung quanh…"),
          Grammar(id: 64, nameJP: "のもとで", nameVN: "Dưới/ Dựa vào/ Nhờ vào …"),
        ],
      ),
      Chapter(
        13,
        [
          Grammar(id: 65, nameJP: "のみならず", nameVN: "Không chỉ…"),
          Grammar(
              id: 66, nameJP: "はもとより", nameVN: "N là đương nhiên, ... Cũng"),
          Grammar(
              id: 67,
              nameJP: "はともかく",
              nameVN: "Khoan bàn, nói đến.../ Chưa cần quan tâm đến...mà…"),
          Grammar(
              id: 68,
              nameJP: "はさておき",
              nameVN: "Chưa nói đến, khoan nói đến, tạm bỏ qua một bên…"),
          Grammar(
              id: 69,
              nameJP: "からには/~以上(は)",
              nameVN: "Một khi mà đã.../ Vì... nên đương nhiên là…"),
          Grammar(
              id: 70,
              nameJP: "からいって/~からいうと",
              nameVN: "Xét từ phương diện...mà nói.../ Xét về mặt... mà nói…"),
          Grammar(
              id: 71,
              nameJP: "からすると/~からすれば",
              nameVN:
                  "Đứng từ (vị trí)...mà nói thì.../ Nhìn từ (cơ sở)... mà nói thì…"),
          Grammar(
              id: 72,
              nameJP: "からして",
              nameVN: "Xét từ góc độ, xét về mặt.../Ngay cả, ngay từ…"),
        ],
      ),
      Chapter(
        14,
        [
          Grammar(id: 73, nameJP: "とは", nameVN: "Thì thật là…"),
          Grammar(
              id: 74, nameJP: "といった", nameVN: "Ví dụ như.../ Chẳng hạn như…"),
          Grammar(
              id: 75,
              nameJP: "とともに",
              nameVN: "Cùng với/càng … càng/đồng thời thì"),
          Grammar(
              id: 76, nameJP: "としても", nameVN: "Cho dù là.../ Thậm chí nếu là…"),
          Grammar(
              id: 77, nameJP: "としたら", nameVN: "Giả sử nếu mà.../ Giả dụ như…"),
          Grammar(id: 78, nameJP: "といったら", nameVN: "Nói về"),
          Grammar(
              id: 79,
              nameJP: "ということだ",
              nameVN: "Có nghĩa là, tóm lại là, tức là…"),
        ],
      ),
      Chapter(
        15,
        [
          Grammar(id: 80, nameJP: "のなんのって", nameVN: "Cực kì, rất…"),
          Grammar(id: 81, nameJP: "あまり", nameVN: "Vì quá…"),
          Grammar(
              id: 82,
              nameJP: "てならない",
              nameVN: "Rất...đến mức không kìm nén được"),
          Grammar(
              id: 83,
              nameJP: "てたまらない",
              nameVN: "Rất...đến mức không chịu được"),
          Grammar(id: 84, nameJP: "得 る", nameVN: "Có khả năng.../ Có thể…"),
          Grammar(
              id: 85,
              nameJP: "やら~やら",
              nameVN: "Vừa...Vừa.../ Nào là... nào là…"),
          Grammar(id: 86, nameJP: "も〜ば 〜も", nameVN: "Cả N1, N2 đều…"),
        ],
      ),
      Chapter(
        16,
        [
          Grammar(
              id: 87, nameJP: "上で", nameVN: "Khi, trong trường hợp/Sau khi…"),
          Grammar(
              id: 88, nameJP: "あげく", nameVN: "Kết cục thì.../ Cuối cùng thì…"),
          Grammar(id: 89, nameJP: "次第", nameVN: "Ngay sau khi..."),
          Grammar(id: 90, nameJP: "次第", nameVN: "Tùy vào/Thế nên là"),
          Grammar(id: 91, nameJP: "末", nameVN: "Cuối cùng thì.../ Kết quả là…"),
        ],
      ),
      Chapter(
        17,
        [
          Grammar(
              id: 92,
              nameJP: "てはじめて",
              nameVN: "Kể từ sau khi...thì mới.../ Chỉ sau khi...mới…"),
          Grammar(id: 93, nameJP: "きり", nameVN: "Kể từ sau khi…"),
          Grammar(id: 94, nameJP: "際", nameVN: "Khi…"),
          Grammar(id: 95, nameJP: "に先立って", nameVN: "Trước khi…"),
          Grammar(id: 96, nameJP: "たところ", nameVN: "Sau khi…"),
        ],
      ),
      Chapter(
        18,
        [
          Grammar(id: 97, nameJP: "つつ", nameVN: "Vừa...vừa…/mặc dù"),
          Grammar(id: 98, nameJP: "ながら", nameVN: "Mặc dù...nhưng…"),
          Grammar(id: 99, nameJP: "わりに(は)", nameVN: "Mặc dù.../So với ...thì…"),
          Grammar(
              id: 100,
              nameJP: "一方(で)",
              nameVN: "Ngược lại với.../ Một mặt thì.../ Mặt khác…"),
          Grammar(
              id: 101,
              nameJP: "一方だ/~ばかりだ",
              nameVN: "Càng ngày càng.../ Có xu hướng…"),
          Grammar(
              id: 102, nameJP: "つつある", nameVN: "Vừa mới... đã ngay lập tức…"),
          Grammar(
              id: 103,
              nameJP: "どころか",
              nameVN: "Chẳng những, lấy đâu ra/ mà ngược lại, thậm chí"),
          Grammar(
              id: 104,
              nameJP: "ようじゃ/~ようでは",
              nameVN: "Nếu...như thế này thì..."),
        ],
      ),
      Chapter(
        19,
        [
          Grammar(
              id: 105,
              nameJP: "どころではない",
              nameVN:
                  "Không phải trong hoàn cảnh để có thể.../Không còn tâm trí để…"),
          Grammar(id: 106, nameJP: "ざるをえない", nameVN: "Buộc phải, đành phải ~"),
          Grammar(id: 107, nameJP: "おそれがある", nameVN: "E rằng.../ Có khả năng…"),
          Grammar(id: 108, nameJP: "よりほかない", nameVN: "Chỉ còn cách.."),
          Grammar(
              id: 109, nameJP: "ようではないか", nameVN: "(Kêu gọi) chúng ta hãy…"),
          Grammar(
              id: 110,
              nameJP: "わけにはいかない",
              nameVN: "Không thể nào mà lại .../ Buộc phải…"),
          Grammar(
              id: 111,
              nameJP: "にほかならない",
              nameVN:
                  "Chắc chắn là.../ Chỉ có thể là.../ Không gì khác ngoài…"),
          Grammar(
              id: 112,
              nameJP: "てはいられない",
              nameVN: "Không thể nào mà... thêm nữa"),
        ],
      ),
    ];
  }
}
