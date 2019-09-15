<?php

namespace App\Controller;

use App\Entity\Admin\Messages;
use App\Entity\User;
use App\Form\Admin\MessagesType;
use App\Form\UserType;
use App\Repository\Admin\CategotyRepository;
use App\Repository\Admin\ProductRepository;
use App\Repository\Admin\SettingRepository;
use App\Repository\Admin\ImagesRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends Controller
{
    /**
     * @Route("", name="home")
     */
    public function index(SettingRepository $settingRepository, CategotyRepository $categotyRepository)
    {
        $data = $settingRepository->findAll();

        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT * FROM product WHERE status='True' ORDER BY ID DESC LIMIT 4 ";
        $statement = $em->getConnection()->prepare($sql);
        //$statement->bindValue('parentid',$parent);
        $statement->execute();
        $sliders = $statement->fetchAll();
        //dump($sliders);
        //die();


        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT * FROM product WHERE status='True' ORDER BY ID LIMIT 35";
        $statement = $em->getConnection()->prepare($sql);
//        $statement->bindValue('pid',$parent);
        $statement->execute();
        $randProducts = $statement->fetchAll();

        $cats =$this->categorytree();
        $cats[0] = '<ul id="menu-v">';
        //print_r($cats);
        //die();

        return $this->render('home/index.html.twig',[
            'data' =>$data,
            'cats' =>$cats,
            'sliders' =>$sliders,
            'randProducts' => $randProducts,

        ]);
    }

    public function categorytree($parent = 0, $user_tree_array =''){

        if(!is_array($user_tree_array))
            $user_tree_array = array();


        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT * FROM category WHERE status='True' AND parentid =".$parent;
        $statement = $em->getConnection()->prepare($sql);
        //$statement->bindValue('parentid',$parent);
        $statement->execute();
        $result = $statement->fetchAll();

        if(count($result) > 0){
            $user_tree_array[] = "<ul>";
            foreach ($result as $row) {
                $user_tree_array[] = "<li> <a href='/category/".$row['id']."'>".$row['title']."</a>";
                $user_tree_array = $this->categorytree($row['id'], $user_tree_array);
            }
            $user_tree_array[] = "</li></ul>";
        }
        return $user_tree_array;
    }

    /**
     * @Route("/category/{catid}", name="category_products")
     */
    public function CategoryProducts($catid, CategotyRepository $categotyRepository)
    {
        $cats = $this->categorytree();
        $cats[0] = '<ul id="menu-v">';

        $data = $categotyRepository->findBy(
          ['id' => $catid]
        );
        //dump($data);
        //die();
        $em = $this->getDoctrine()->getManager();
        $sql = 'SELECT * FROM product WHERE status="True" AND categoryid = :catid';
        $statement = $em->getConnection()->prepare($sql);
        $statement->bindValue('catid',$catid);
        $statement->execute();
        $products = $statement->fetchAll();
        //dump($products);
        //die();
        return $this->render('home/products.html.twig',[
            'data' => $data,
            'products'=> $products,
            'cats' => $cats,
        ]);
    }

    /**
     * @Route("/product/{id}", name="product_detail", methods="GET")
     */
    public function ProductDetail($id, ProductRepository $productRepository, ImagesRepository $imagesRepository)
    {
        $data = $productRepository->findBy(
            ['id' => $id]
        );
        $images = $imagesRepository->findBy(
            ['productid' => $id]
        );
        $cats =$this->categorytree();
        $cats[0] = '<ul id="menu-v">';

        return $this->render('home/product_detail.html.twig',[
            'data' =>$data,
            'cats' =>$cats,
            'images' => $images,
        ]);
    }

    /**
     * @Route("/hakkimizda", name="hakkimizda")
     */
    public function hakkimizda(SettingRepository $settingRepository)
    {
        $data = $settingRepository->findAll();

        return $this->render('home/hakkimizda.html.twig',[
            'data' =>$data,
        ]);
    }

    /**
     * @Route("/iletisim", name="iletisim", methods="GET|POST")
     */
    public function iletisim(SettingRepository $settingRepository, Request $request)
    {
        $message = new Messages();
        $form = $this->createForm(MessagesType::class, $message);
        $form->handleRequest($request);
        $submittedToken = $request->request->get('token');

        if ($form->isSubmitted()) {
            if($this->isCsrfTokenValid('form-message', $submittedToken)){
                $em = $this->getDoctrine()->getManager();
                $em->persist($message);
                $em->flush();
                $this->addFlash('success','mesajınız başarıyla iletildi');
                return $this->redirectToRoute('iletisim');
            }
        }
        $data = $settingRepository->findAll();

        return $this->render('home/iletisim.html.twig',[
            'data' =>$data,
            'message' => $message,
        ]);
    }

    /**
     * @Route("/referans", name="referans")
     */
    public function referans(SettingRepository $settingRepository)
    {
        $data = $settingRepository->findAll();

        return $this->render('home/referans.html.twig',[
            'data' =>$data,
        ]);
    }


    /**
     * @Route("newuser", name="new_user", methods="GET|POST")
     */
    public function newuser(Request $request,UserRepository $userRepository):Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class,$user);
        $form->handleRequest($request);

        $submittedToken = $request->request->get('token');
        if ($this->isCsrfTokenValid('user-form',$submittedToken)) {

            if ($form->isSubmitted()) {


                $emaildata = $userRepository->findBy(
                    ['email' => $user->getEmail()]
                );

                if ($emaildata == null) {
                    $em = $this->getDoctrine()->getManager();
                    $user->setRoles("ROLE_USER");
                    $em->persist($user);
                    $em->flush();
                    $this->addFlash('success', 'Üye kaydiniz basariyla olusturulmustur . Login olabilirsiniz');
                    return $this->redirectToRoute('app_login');
                }
                else {
                    $this->addFlash('error', $user->getEmail(). "email adresi var");

                }
            }
        }

        return $this->render('home/newuser.html.twig',[
            'user' => $user,
            'form' => $form->createView(),
        ]);
    }
}
