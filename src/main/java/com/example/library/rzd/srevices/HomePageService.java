package com.example.library.rzd.srevices;

import com.example.library.rzd.models.HomePage;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HomePageService{
    private List<HomePage> homePageList = new ArrayList<>();
    private Long id = 1l;
    {
        homePageList.add(new HomePage(++id,"1987", "Oruel"));
    }
    public List<HomePage> homePageList() {
        return homePageList;
    }
     public void saveHomePage(HomePage homePage){
        homePage.setId(++id);
         homePageList.add(homePage);
     }
     public void deleteHomePage(Long id){
        homePageList.removeIf(homePage -> homePage.getId().equals(id));
     }

    public HomePage getBookById(Long id) {
        for (HomePage homePage : homePageList) {
            if (homePage.getId().equals(id)) {
                return homePage;
            }
        }
        return null;
    }
}
