# Nim Euclid ★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Adam Karczmarz  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `euk`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/euk>


## Đề bài

Euclid và Pythagoras là biệt danh của hai người Byteotia nổi tiếng vì niềm say mê những câu đố toán học. Gần đây, họ thường dành buổi tối để chơi trò chơi sau.

Trên bàn có một đống gồm \(n\) viên đá. Hai người lần lượt thực hiện nước đi. Trong lượt của Euclid:

- nếu đống có ít nhất \(p\) viên đá, anh lấy đi một bội dương tùy ý của \(p\), nhưng không được lấy nhiều hơn số đá đang có;
- nếu đống có ít hơn \(p\) viên đá, anh phải thêm đúng \(p\) viên vào đống.

Nước đi của Pythagoras cũng tương tự, nhưng dùng số \(q\): anh lấy đi một bội dương tùy ý của \(q\), hoặc thêm đúng \(q\) viên khi đống có ít hơn \(q\) viên.

Người làm đống đá trở thành rỗng sẽ thắng. Euclid đi trước.

Hai người muốn biết liệu mình đã hiểu trò chơi này một cách hoàn hảo hay chưa. Hãy viết chương trình xác định kết quả của ván đấu khi cả hai đều chơi tối ưu.

### Dữ liệu vào

Dòng đầu chứa số nguyên \(t\)

\[
1\le t\le1000,
\]

là số bộ test. Mỗi bộ test gồm một dòng chứa ba số nguyên \(p,q,n\)

\[
1\le p,q,n\le10^9.
\]

### Dữ liệu ra

In đúng \(t\) dòng, mỗi dòng là đáp án cho một bộ test. Đáp án là một trong ba chữ cái:

- `E` nếu Euclid có thể bảo đảm chiến thắng, bất kể Pythagoras chơi thế nào;
- `P` nếu Pythagoras có thể bảo đảm chiến thắng, bất kể Euclid chơi thế nào;
- `R` nếu ván đấu sẽ kéo dài vô hạn, tức là hòa.

### Ví dụ

**Dữ liệu vào**

```text
4
3 2 1
2 3 1
3 4 5
2 4 3
```

**Dữ liệu ra**

```text
P
P
E
R
```

**Giải thích.** Trong bộ test đầu tiên, ở lượt đầu Euclid buộc phải thêm \(3\) viên đá. Khi đó Pythagoras có thể lấy cả \(4\) viên và giành chiến thắng.

## Lời giải

Đặt

\[
d=\gcd(p,q).
\]

Trước hết, nhận xét rằng mọi nước đi của cả hai người, dù thêm hay lấy đá, đều thay đổi số đá trong đống một lượng là bội của \(d\). Vì vậy, số dư

\[
r=n\bmod d
\]

không đổi trong suốt ván đấu. Nếu ban đầu \(r\ne0\), không người nào có thể làm đống đá trở thành rỗng, nên ván đấu kéo dài vô hạn. Như ta sẽ thấy, đây là trường hợp hòa duy nhất.

Từ giờ, giả sử \(r=0\). Trong suốt ván đấu, số đá luôn chia hết cho \(d\). Ta có thể chia cả \(n,p,q\) cho \(d\); phép biến đổi này không làm thay đổi kết quả, đồng thời khiến \(p\) và \(q\) nguyên tố cùng nhau.

Nếu sau khi chia mà \(p=q\), do hai số nguyên tố cùng nhau nên nhất thiết

\[
p=q=1.
\]

Người đi trước hiển nhiên thắng bằng cách lấy hết đá ngay trong lượt đầu. Do Euclid đi trước, đáp án là `E`.

Ta còn phải xử lý trường hợp

\[
\gcd(p,q)=1,\qquad p\ne q.
\]

Để phân tích thuận tiện, tạm quên tên hai người và ai là người đi trước. Ta gọi người có thể lấy một số đá chia hết cho \(p\) là người chơi \(P\), còn người kia là người chơi \(Q\). Ta xét riêng trường hợp \(P\) đi trước và \(Q\) đi trước. Nhờ vậy, không mất tính tổng quát, ta có thể giả sử

\[
p<q.
\]

### Phân tích các trường hợp

Lời giải dựa trên bốn trường hợp; mỗi trường hợp sau sẽ được quy về những trường hợp trước.

#### Trường hợp A: \(Q\) đi trước và \(n<q\)

Ta sẽ chứng minh rằng \(P\) có thể thắng bằng cách luôn buộc \(Q\) phải thêm \(q\) viên đá.

Trong lượt đầu, \(Q\) buộc phải thêm \(q\) viên. Sau đó \(P\) lấy số đá lớn nhất được phép để trong đống còn

\[
(n+q)\bmod p<p<q
\]

viên. Nếu số dư bằng \(0\), \(P\) thắng ngay. Nếu không, \(Q\) lại buộc phải thêm \(q\) viên.

Tiếp tục như vậy, \(Q\) luôn chỉ có thể thêm \(q\) viên nên chắc chắn không thể làm rỗng đống. Sau lượt thứ \(k\) của \(P\), trong đống còn

\[
(n+kq)\bmod p
\]

viên, miễn là ván đấu chưa kết thúc.

Ta chỉ cần chứng minh tồn tại \(k\ge1\) sao cho

\[
n+kq\equiv0\pmod p.
\]

Vì \(\gcd(p,q)=1\), thuật toán Euclid mở rộng tìm được các số nguyên \(\ell_0,k_0\) thỏa

\[
\ell_0p+k_0q=1,
\]

hay

\[
k_0q\equiv1\pmod p.
\]

Chọn

\[
k=(-nk_0)\bmod p+p.
\]

Khi đó \(k\ge p\ge1\), và

\[
n+kq
\equiv n-nk_0q+pq
\equiv0\pmod p.
\]

Vì vậy, ván đấu cuối cùng sẽ kết thúc với chiến thắng của \(P\).

#### Trường hợp B: \(P\) đi trước và \(n\ge p\)

\(P\) có thể thắng. Nếu \(p\mid n\), người này lấy hết đá ngay ở lượt đầu. Nếu không, \(P\) để lại

\[
n\bmod p<p<q
\]

viên và đưa trò chơi về trường hợp A, trong đó đối thủ \(Q\) là người đi tiếp.

#### Trường hợp C: \(P\) đi trước và \(n<p\)

Ta sẽ chứng minh rằng \(P\) thắng khi và chỉ khi

\[
(q-p)\nmid n.
\]

Trong lượt đầu, \(P\) buộc phải thêm \(p\) viên. Nếu \(n+p<q\), nước đi này đưa trò chơi về trường hợp A và \(P\) thắng.

Nếu không, ta có

\[
q\le n+p<2q,
\]

nên \(Q\) buộc phải lấy đúng \(q\) viên. Sau hai lượt, đống còn \(n+p-q\) viên. Nếu số này bằng \(0\), \(Q\) thắng. Nếu lượt thứ ba đưa trò chơi về trường hợp A thì \(P\) thắng; nếu không, sau lượt thứ tư còn

\[
n-2(q-p)
\]

viên.

Lặp lại lập luận này. Nếu coi \(P\) là người thắng ngay khi sau lượt của mình đống còn ít hơn \(q\) viên, theo trường hợp A, thì mọi nước đi tiếp theo đều được xác định duy nhất: \(P\) luôn thêm \(p\) viên và \(Q\) luôn lấy \(q\) viên. Sau lượt thứ \(2k\), đống còn

\[
n-k(q-p)
\]

viên; sau lượt thứ \(2k+1\), đống còn

\[
n-k(q-p)+p
\]

viên, miễn là ván đấu chưa kết thúc.

Đặt

\[
\ell=\left\lfloor\frac{n}{q-p}\right\rfloor.
\]

Người chơi \(Q\) không thể thắng trước lượt thứ \(2\ell\), bởi với mọi số nguyên \(\ell'<\ell\),

\[
n-\ell'(q-p)>n-\ell(q-p)\ge0.
\]

Tương tự, \(P\) không thể thắng trước lượt thứ \(2\ell+1\), vì

\[
\begin{aligned}
n-\ell'(q-p)+p
&\ge n-(\ell-1)(q-p)+p\\
&=n-\ell(q-p)+q\\
&\ge q.
\end{aligned}
\]

Nếu \(q-p\mid n\), \(Q\) làm rỗng đống ở lượt thứ \(2\ell\) và thắng; ta vừa chứng minh rằng \(P\) không thể thắng trước đó.

Ngược lại, nếu \(q-p\nmid n\), viết

\[
n=\ell(q-p)+r,
\qquad 0<r<q-p.
\]

Sau lượt thứ \(2\ell+1\), số đá còn lại là

\[
\begin{aligned}
n-\ell(q-p)+p
&=r+p\\
&<(q-p)+p=q.
\end{aligned}
\]

Do đó \(P\) thắng theo trường hợp A. \(Q\) không thể làm rỗng đống sớm hơn vì \(q-p\) không chia hết \(n\).

#### Trường hợp D: \(Q\) đi trước và \(n\ge q\)

Trong trường hợp này, \(P\) thua khi và chỉ khi số dư

\[
r=n\bmod q
\]

đồng thời thỏa

\[
r<p
\qquad\text{và}\qquad
(q-p)\mid r.
\]

Viết

\[
n=kq+r,
\qquad 0\le r<q.
\]

Nếu \(Q\) lấy ít hơn \(kq\) viên, đống còn ít nhất

\[
q+r>p
\]

viên. Nước đi đó đưa trò chơi về trường hợp B, nên \(P\) thắng. Vì vậy, để có cơ hội thắng, \(Q\) buộc phải để lại đúng \(r\) viên.

Nếu \(r\ge p\), ta lại có trường hợp B và \(P\) thắng. Nếu \(r<p\), ta rơi vào trường hợp C: \(P\) thắng khi và chỉ khi \(q-p\) không chia hết \(r\). Điều này chứng minh điều kiện đã nêu.

### Thuật toán

Với mỗi bộ test có các giá trị ban đầu \(p_E,q_P,n\), trong đó \(p_E\) là tham số của Euclid và \(q_P\) là tham số của Pythagoras:

1. Tính \(d=\gcd(p_E,q_P)\). Nếu \(d\nmid n\), in `R`.
2. Chia \(p_E,q_P,n\) cho \(d\).
3. Nếu \(p_E=q_P\), in `E`.
4. Nếu \(p_E<q_P\), Euclid chính là người chơi \(P\) và đi trước:
   - nếu \(n\ge p_E\), in `E` theo trường hợp B;
   - nếu \(n<p_E\), in `E` khi \((q_P-p_E)\nmid n\), ngược lại in `P`, theo trường hợp C.
5. Nếu \(p_E>q_P\), Pythagoras là người chơi \(P\), Euclid là người chơi \(Q\), và \(Q\) đi trước. Đặt \(p=q_P\), \(q=p_E\):
   - nếu \(n<q\), in `P` theo trường hợp A;
   - nếu \(n\ge q\), đặt \(r=n\bmod q\). In `E` khi \(r<p\) và \((q-p)\mid r\); ngược lại in `P`, theo trường hợp D.

Có thể viết phần quyết định bằng mã giả:

Trong mã giả, `euclidParameter`, `pythagorasParameter` và `pileSize` lần lượt là \(p_E\), \(q_P\) và \(n\).

```pseudocode
d = gcd(euclidParameter, pythagorasParameter)
if pileSize mod d != 0:
    answer = 'R'
else:
    euclidParameter = euclidParameter / d
    pythagorasParameter = pythagorasParameter / d
    pileSize = pileSize / d

    if euclidParameter == pythagorasParameter:
        answer = 'E'
    else if euclidParameter < pythagorasParameter:
        if pileSize >= euclidParameter or
           pileSize mod (pythagorasParameter - euclidParameter) != 0:
            answer = 'E'
        else:
            answer = 'P'
    else:
        smallerParameter = pythagorasParameter
        largerParameter = euclidParameter
        if pileSize < largerParameter:
            answer = 'P'
        else:
            remainder = pileSize mod largerParameter
            if remainder < smallerParameter and
               remainder mod (largerParameter - smallerParameter) == 0:
                answer = 'E'
            else:
                answer = 'P'

return answer
```

### Chứng minh tính đúng đắn

Nếu \(d=\gcd(p_E,q_P)\) không chia hết \(n\), số đá luôn đồng dư với \(n\) theo môđun \(d\), nên không thể bằng \(0\); thuật toán trả về `R` là đúng.

Nếu \(d\mid n\), việc chia cả ba giá trị cho \(d\) bảo toàn chính xác mọi nước đi và điều kiện thắng. Sau phép chuẩn hóa, hai tham số nguyên tố cùng nhau. Khi chúng bằng nhau, cả hai đều bằng \(1\), nên Euclid thắng ngay.

Khi hai tham số khác nhau, ta gán người sở hữu tham số nhỏ hơn là \(P\), người còn lại là \(Q\). Bốn trường hợp A–D bao phủ mọi trạng thái ban đầu theo hai tiêu chí: người đi trước là \(P\) hay \(Q\), và số đá nhỏ hơn hay không nhỏ hơn tham số của người đi trước. Các chứng minh ở trên xác định chính xác người thắng trong từng trường hợp. Thuật toán chỉ việc ánh xạ kết quả đó trở lại tên Euclid và Pythagoras, nên trả về đúng kết quả của ván đấu.

### Độ phức tạp

Với mỗi bộ test, tính

\[
d=\gcd(p,q)
\]

bằng thuật toán Euclid tốn

\[
O(\log\min(p,q))
\]

thời gian. Mọi phép kiểm tra còn lại đều tốn \(O(1)\). Thuật toán dùng \(O(1)\) bộ nhớ phụ cho mỗi bộ test.
