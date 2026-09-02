# Cuộc đua đường phố Bytean ★★★★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Jakub Łącki  
**Bộ nhớ:** 64 MB  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2011/baj>


## Đề bài

Ngày mai, Cuộc đua đường phố Bytean sẽ diễn ra tại trung tâm thành phố Bytetown. Các con phố của Bytetown tạo thành một lưới đều: tất cả đều chạy theo hướng nam–bắc hoặc tây–đông. Người tham gia chỉ được phép chạy trên một số đoạn đường đã cho.

Byteasar có nhiệm vụ đặt biểu ngữ của các nhà tài trợ tại một số giao lộ. Để làm việc đó, anh phải nghiên cứu bản đồ đường chạy. Trên bản đồ có \(n\) giao lộ và \(m\) đoạn đường thẳng đứng hoặc nằm ngang được đánh dấu. Mỗi đoạn bắt đầu và kết thúc tại một giao lộ, không chứa giao lộ nào khác ở bên trong. Các đoạn đường chỉ có thể cắt nhau tại giao lộ.

Các giao lộ được đánh số từ \(1\) đến \(n\). Cuộc đua bắt đầu tại giao lộ \(1\) và kết thúc tại giao lộ \(n\). Các vận động viên được tự chọn lộ trình, nhưng chỉ được chạy về phía nam và phía đông, đồng thời chỉ được đi trên các đoạn đã đánh dấu. Những đoạn đường trên bản đồ được chọn sao cho, nếu tuân thủ các quy tắc, từ mọi vị trí đều có thể tới đích và mọi vị trí đều có thể đi tới từ giao lộ xuất phát.

Byteasar muốn đặt các biểu ngữ sao cho không vận động viên nào nhìn thấy biểu ngữ của cùng một nhà tài trợ hai lần. Vì vậy, với một số cặp giao lộ, anh cần kiểm tra liệu có lộ trình của một vận động viên đi qua cả hai giao lộ hay không. Cuộc đua diễn ra ngay ngày mai, nên anh rất cần một chương trình hỗ trợ công việc này.

### Dữ liệu vào

Dòng đầu chứa ba số nguyên \(n,m,k\) (\(2\le n\le100\,000\), \(1\le m\le200\,000\), \(1\le k\le300\,000\)), lần lượt là số giao lộ trên đường đua, số đoạn đường được đánh dấu và số cặp giao lộ cần kiểm tra.

\(n\) dòng tiếp theo mô tả vị trí các giao lộ. Dòng thứ \(i\) chứa hai số nguyên \(x_i,y_i\) (\(-10^9\le x_i,y_i\le10^9\)), là tọa độ của giao lộ \(i\). Ngoài ra, \(x_1\le x_n\) và \(y_1\ge y_n\). Không có hai giao lộ nào cùng nằm tại một điểm. Các trục tọa độ tương ứng với các hướng địa lý theo cách tự nhiên: trục \(OX\) hướng về phía đông, còn trục \(OY\) hướng về phía bắc.

Mỗi dòng trong \(m\) dòng tiếp theo chứa hai số nguyên \(a_i,b_i\) (\(1\le a_i,b_i\le n\), \(a_i\ne b_i\)), mô tả một đoạn nối hai giao lộ mang số hiệu ấy. Tất cả các đoạn đều thẳng đứng hoặc nằm ngang và chỉ có thể giao nhau tại đầu mút chung, tức các giao lộ.

\(k\) dòng sau cùng mô tả các cặp cần kiểm tra. Dòng thứ \(i\) chứa hai số nguyên \(p_i,q_i\) (\(1\le p_i,q_i\le n\), \(p_i\ne q_i\)).

### Dữ liệu ra

In ra \(k\) dòng. Dòng thứ \(i\) chứa `TAK` (nghĩa là “có” trong tiếng Ba Lan) nếu tồn tại lộ trình của một vận động viên đi qua cả hai giao lộ \(p_i,q_i\), theo thứ tự bất kỳ. Nếu không, in `NIE` (“không”).

### Ví dụ

```text
Input          Output
9 10 4         TAK
1 6            NIE
2 6            NIE
4 4            TAK
1 4
3 4
4 6
6 4
3 1
6 1
1 2
4 1
2 6
2 6
3 6
5 4
5 3
5 8
3 7
7 9
9 8
4 8
2 5
8 7
7 6
```

## Lời giải

Trước hết, hãy quay bản đồ Bytetown \(135^\circ\) sang trái. Khi đó giao lộ xuất phát nằm ở đáy bản đồ, giao lộ đích nằm trên đỉnh, và các đường rời một giao lộ theo hai hướng chéo: lên trái hoặc lên phải. Phép quay không làm thay đổi đáp án, nhưng cách nhìn này thuận tiện hơn.

![Hình 1. Bản đồ trong ví dụ trước và sau khi quay \(135^\circ\). Sau phép quay, đỉnh 1 ở dưới cùng và đỉnh 9 ở trên cùng.](figures/2011-baj-fig-1.png)

Ta xem bản đồ là một đồ thị có hướng: \(n\) đỉnh biểu diễn các giao lộ và \(m\) cạnh biểu diễn các đoạn đường có thể chạy qua.

Với một đỉnh \(v\), gọi **đường trái** xuất phát từ \(v\) là đường đi bắt đầu tại \(v\), rồi tại mỗi đỉnh tiếp theo luôn rẽ sang trái nếu có thể. Nếu đỉnh chỉ có cạnh sang phải thì đường trái đi theo cạnh ấy. Đường trái kết thúc tại đỉnh đích. **Đường phải** được định nghĩa tương tự. Ký hiệu hai đường này là \(L_v\) và \(R_v\). Trong ví dụ ở hình 1, \(L_4\) đi qua \(4,5,3,7,9\), còn \(R_4\) đi qua \(4,5,8,9\).

Giả sử cần kiểm tra có thể đi từ đỉnh \(p=(x_p,y_p)\) tới đỉnh \(q=(x_q,y_q)\) hay không. Kẻ đường thẳng ngang \(h\) qua \(q\). Ta giả sử \(p\) nằm dưới \(h\); nếu không thì hiển nhiên không tồn tại đường từ \(p\) tới \(q\), trừ trường hợp \(p=q\). Vẽ hai đường \(L_p,R_p\).

**Điều kiện 1.** Đường \(L_p\) cắt \(h\) tại \(q\) hoặc về bên trái \(q\), đồng thời \(R_p\) cắt \(h\) tại \(q\) hoặc về bên phải \(q\).

Nếu có đường \(S_{pq}\) từ \(p\) tới \(q\), điều kiện này nhất thiết đúng: \(S_{pq}\) cắt \(h\) tại \(q\); đường trái từ \(p\) không bao giờ có thể nằm về bên phải \(S_{pq}\), và tương tự, đường phải từ \(p\) không bao giờ nằm về bên trái \(S_{pq}\).

![Hình 2. Bên trái: đường \(S_{pq}\) nằm trong miền kẹp giữa \(L_p\) và \(R_p\). Bên phải: \(S_{sq}\) cắt \(L_p\), nhờ đó ghép được một đường từ \(p\) đến \(q\).](figures/2011-baj-fig-2.png)

Chiều ngược lại cũng đúng. Giả sử điều kiện 1 được thỏa mãn. Xét một đường \(S_{sq}\) từ đỉnh xuất phát \(s\) tới \(q\); đường này chắc chắn tồn tại vì từ \(s\) có thể tới mọi đỉnh. Mọi đường tới \(q\) bắt đầu tại \(p\) hoặc ở phía dưới \(p\) đều phải cắt \(L_p\) hoặc \(R_p\). Giả sử \(S_{sq}\) cắt \(L_p\). Ta đi từ \(p\) theo \(L_p\) tới giao điểm, rồi chuyển sang \(S_{sq}\) và đi tiếp tới \(q\). Trường hợp cắt \(R_p\) hoàn toàn tương tự. Vậy để kiểm tra khả năng đi từ \(p\) tới \(q\), chỉ cần kiểm tra điều kiện 1.

### Cấu trúc của các đường trái và phải

Các đường trái và phải có cấu trúc rất chặt chẽ. Muốn dựng đường trái từ \(v\), ta đi theo cạnh đầu tiên — sang trái nếu có, nếu không thì sang phải — để tới \(w\). Từ đó trở đi, phần còn lại của \(L_v\) trùng hoàn toàn với \(L_w\).

Ta dựng mảng hai chiều `left` để di chuyển nhanh trên các đường trái bằng kỹ thuật **binary lifting**. Với mọi đỉnh \(v\) và \(0\le i\le\lfloor\log_2 n\rfloor\), `left[v][i]` là đỉnh đạt tới sau \(2^i\) bước trên \(L_v\). Mảng `right` cho các đường phải được dựng tương tự. Để tiện xử lý, thêm tại đỉnh đích một khuyên đi từ chính nó về nó; nhờ vậy mọi ô trong hai mảng đều được xác định.

Giá trị `left[v][0]` chính là đỉnh ở cuối cạnh đầu tiên của \(L_v\). Sau đó tính lần lượt theo công thức

\[
\texttt{left}[v][i]
=\texttt{left}\bigl[\texttt{left}[v][i-1]\bigr][i-1].
\]

Thật vậy, trước hết ta đi \(2^{i-1}\) bước từ \(v\) để tới \(w\), sau đó đi thêm \(2^{i-1}\) bước trên \(L_w\), vốn trùng với phần còn lại của \(L_v\). Hai bảng `left` và `right` đều có \(O(n\log n)\) ô, nên được dựng trong tổng thời gian \(O(n\log n)\).

Sau khi có hai bảng, ta kiểm tra điều kiện 1 bằng một dạng tìm kiếm nhị phân. Chẳng hạn, cần tìm nơi \(L_p\) cắt đường \(h\). Bắt đầu ở \(p\), ta đi dọc \(L_p\) nhưng luôn bảo đảm chưa vượt lên trên \(h\). Với \(i=\lfloor\log_2 n\rfloor,\ldots,0\), xét đỉnh đạt được sau \(2^i\) bước từ đỉnh hiện tại. Nếu đỉnh đó cao hơn \(h\) thì không đi; nếu nó nằm trên chính \(h\) hoặc ở dưới \(h\) thì thực hiện bước nhảy \(2^i\).

Kết thúc quá trình, ta ở đỉnh cao nhất \(w\) trên \(L_p\) mà không cao hơn \(h\). Chỉ còn xác định cạnh đầu tiên của \(L_w\) cắt \(h\) về phía nào so với \(q\). Làm tương tự với \(R_p\) là kiểm tra được điều kiện 1.

Như vậy, sau \(O(n\log n)\) thời gian tiền xử lý, mỗi truy vấn được trả lời trong \(O(\log n)\).

### Lời giải nhanh hơn

Mặc dù lời giải trên đã đủ nhanh, ta còn có một thuật toán thú vị với thời gian tiền xử lý tuyến tính. Trước hết xét một bài toán tưởng như không liên quan.

#### Vị trí tương đối của hai đỉnh trong cây

Xét một cây nhị phân có gốc, trong đó mỗi đỉnh có không, một hoặc hai con. Nếu có hai con, ta phân biệt con trái và con phải. Chọn hai đỉnh khác nhau \(a,b\), và gọi \(S_a,S_b\) là các đường từ gốc tới chúng.

Chỉ có đúng bốn khả năng: \(a\) nằm **trên** \(b\) (tức \(a\in S_b\)); \(a\) nằm **dưới** \(b\) (tức \(b\in S_a\)); \(a\) nằm **bên trái** \(b\) (khi đi từ \(a\) về gốc, ta nhập vào \(S_b\) từ bên trái); hoặc \(a\) nằm **bên phải** \(b\). Hai trường hợp đầu đối xứng với nhau, hai trường hợp sau cũng vậy.

![Hình 3. Hai trường hợp tiêu biểu: \(a\) nằm trên \(b\), và \(a\) nằm bên trái \(b\). Hai trường hợp còn lại thu được bằng cách đổi vai \(a,b\).](figures/2011-baj-fig-3.png)

Chạy DFS trên cây. Với mỗi đỉnh \(v\), ghi thời điểm vào \(I_v\) và thời điểm ra \(O_v\), tức thời điểm thăm \(v\) lần đầu và thời điểm ngay sau khi đã duyệt xong toàn bộ cây con của \(v\). Vị trí tương đối của hai đỉnh phân biệt \(a,b\) được xác định như sau:

- \(a\) nằm trên \(b\) khi và chỉ khi \(I_a<I_b\) và \(O_b<O_a\);

- \(a\) nằm dưới \(b\) khi và chỉ khi \(I_b<I_a\) và \(O_a<O_b\);

- \(a\) nằm bên trái \(b\) khi và chỉ khi \(O_a<I_b\);

- \(a\) nằm bên phải \(b\) khi và chỉ khi \(O_b<I_a\).

Vì thế, sau \(O(n)\) thời gian tiền xử lý, ta xác định được vị trí tương đối của hai đỉnh trong \(O(1)\).

#### Lời giải thời gian tuyến tính

Ta dựng đồ thị của các đường trái bằng cách lấy hợp của đường trái xuất phát từ mọi đỉnh. Đồ thị này có cùng \(n\) đỉnh với bản đồ Bytetown, nhưng từ mỗi đỉnh, trừ đỉnh đích, chỉ giữ đúng một cạnh: cạnh trái nếu có, nếu không thì cạnh phải.

Đồ thị thu được là một cây nhị phân có gốc tại đỉnh đích. Đây cũng là lý do ta quay bản đồ để đích ở trên: cây đường trái có gốc ở trên và mọc xuống dưới như cách thường vẽ cây. Gọi cây này là \(T_L\). Tương tự, dựng cây đường phải \(T_R\).

Một lần nữa, cần kiểm tra có đường từ \(p\) tới \(q\) hay không. Kẻ đường ngang \(h\) qua \(q\) và xét vị trí tương đối của \(p,q\) trong \(T_L\):

- Nếu \(p\) nằm dưới \(q\), đường cần tìm tồn tại ngay trong \(T_L\).

- \(p\) không thể nằm trên \(q\) nếu về mặt hình học \(p\) ở dưới \(h\), vì khi ấy \(p\) phải nằm phía trên \(h\).

- Nếu \(p\) nằm bên trái \(q\), hai đường \(L_p,L_q\) nhập lại tại một đỉnh, trong đó \(L_p\) đi vào từ trái và \(L_q\) đi vào từ phải. Lần ngược đồng thời hai đường xuống tới \(h\), \(L_q\) gặp \(q\), còn \(L_p\) gặp \(h\) bên trái \(q\).

- Nếu \(p\) nằm bên phải \(q\), \(L_p\) cắt \(h\) bên phải \(q\).

Đây chính là một nửa của điều kiện 1. Do đó điều kiện về đường trái tương đương với: trong \(T_L\), \(p\) nằm **dưới** hoặc **bên trái** \(q\). Tương tự, điều kiện về đường phải tương đương với: trong \(T_R\), \(p\) nằm **dưới** hoặc **bên phải** \(q\).

Tóm lại, trước tiên dựng \(T_L,T_R\), rồi chạy DFS trên mỗi cây để lấy thời điểm vào/ra. Cả hai bước tốn \(O(n)\). Với mỗi cặp không có thứ tự trong đề, chọn đỉnh thấp hơn trên bản đồ đã quay làm \(p\), đỉnh cao hơn làm \(q\). Có thể so sánh độ cao này ngay trên tọa độ ban đầu bằng \(x-y\), vì mỗi bước chạy về đông hoặc về nam đều làm đại lượng ấy tăng. Nếu hai đỉnh khác nhau có cùng độ cao thì chúng không thể cùng nằm trên một lộ trình. Sau đó đáp án là `TAK` khi và chỉ khi đồng thời:

1. \(p\) không nằm cao hơn \(q\);
2. trong \(T_L\), \(p\) nằm dưới hoặc bên trái \(q\);
3. trong \(T_R\), \(p\) nằm dưới hoặc bên phải \(q\).

Mọi phép kiểm tra đều là \(O(1)\). Tổng thời gian là \(O(n+m+k)\) nếu tính cả việc đọc và định hướng \(m\) đoạn đường; phần tiền xử lý sau khi đã có đồ thị là \(O(n)\), mỗi truy vấn \(O(1)\), và bộ nhớ sử dụng là \(O(n+m)\).

Kết quả tối ưu này có được nhờ cấu trúc đặc biệt của đồ thị: phẳng, không chu trình, chỉ có đúng một nguồn và một đích. Với đồ thị tổng quát, bài toán khó hơn nhiều: thuật toán được biết đến trong tài liệu nguồn để trả lời truy vấn trong \(O(1)\) cần \(O(n^{2.38}\) thời gian tiền xử lý và sử dụng phép nhân ma trận nhanh.
