//
// Created by anzer on 2019/9/30.
// 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/
// Ŷ������������
//
#include <iostream>
#include <string>
using  namespace std;

class Solution {
public:
    string longestPalindrome(string &s) {
        auto len = s.size() * 2 + 2;
        auto ss = new char[len + 20]; // �㷨������ͷ�
        auto p = new int[len + 20]; // �㷨������ͷ�
        // ��û˵�ַ���Χ�ǲ���a-z�������ô���������ȼ�װ����a-z�ɣ����Ǳ�����һ��WA��

        // ��������
        for (auto i = 2; i < len; i += 2) {
            ss[i] = s[i / 2 - 1];
            ss[i + 1] = '#';
        }
        ss[0] = '$';
        ss[1] = '#';
        ss[len] = '\0';

        int mid = 0;
        int mx = 0;
        int ans_mid = 0;
        int ans_len = 0;

        p[0] = 0;

        for (auto i = 1; i < len; i++) {
            p[i] = mx > i ? min(p[mid - (i - mid)], mx - i) : 0 ;
            while ( ss[ i + p[i] + 1] == ss[i - p[i] - 1]) p[i]++;


            if (mx < i + p[i]) {
                mx = i + p[i];
                mid = i;
            }

            if ( ans_len < p[i]) {
                ans_len = p[i];
                ans_mid = i;
            }
        }

        for(int i = 0; i < len; i++) {
            cout << p[i] << ' ';
        }
        cout << endl;

        for(int i = 0; i < len; i++) {
            cout << ss[i] << ' ';
        }
        cout << endl;


        ////// ����� //////
        cout << "ans_mid:" << ans_mid << endl;
        cout << "ans_len:" << ans_len << endl;
        auto ans =  new char[len + 20];
        int idx = 0;
        for(auto i = (ans_mid - ans_len - 1) / 2 ; i < (ans_mid + ans_len - 1) / 2; i++) {
            ans[idx++] = s[i];
        }
        ans[idx] = '\0';

        return ans;
    }
};

int resolve5() {
    auto q = string("ccc");
    auto s = new Solution();

    cout << s->longestPalindrome(q) << endl;
    return 0;
}