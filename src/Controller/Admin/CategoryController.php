<?php

namespace App\Controller\Admin;

use App\Entity\Admin\Category;
use App\Form\Admin\CategoryType;
use App\Repository\Admin\CategotyRepository;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/category")
 */
class CategoryController extends Controller
{
    /**
     * @Route("/", name="admin_category_index", methods="GET")
     */
    public function index(CategotyRepository $categotyRepository): Response
    {
        return $this->render('admin/category/index.html.twig', ['categories' => $categotyRepository->findAll()]);
    }

    /**
     * @Route("/new", name="admin_category_new", methods="GET|POST")
     */
    public function new(Request $request, CategotyRepository $categotyrepository): Response
    {
        $catlist = $categotyrepository->findBy(['parentid' => 0]);
        $category = new Category();
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($category);
            $em->flush();

            return $this->redirectToRoute('admin_category_index');
        }

        return $this->render('admin/category/new.html.twig', [
            'category' => $category,
            'catlist' => $catlist,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_category_show", methods="GET")
     */
    public function show(Category $category): Response
    {
        return $this->render('admin/category/show.html.twig', ['category' => $category]);
    }

    /**
     * @Route("/{id}/edit", name="admin_category_edit", methods="GET|POST")
     */
    public function edit(Request $request, CategotyRepository $categotyRepository, Category $category): Response
    {
        $catlist = $categotyRepository->findBy(['parentid'=>0]);
        if($category->getParentid() !=0){
            $catname = $categotyRepository->findOneBy(['id'=>$category->getParentid()]);
        }
        else{
            $catname = array(
                'title'=>"ana kategoridesiniz",
                'id'=>0,
            );
        }
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();
            $this->addFlash('success','kayıt başarılı');

            return $this->redirectToRoute('admin_category_index', ['id' => $category->getId()]);
        }
        return $this->render('admin/category/edit.html.twig', [
            'category' => $category,
            'catlist' => $catlist,
            'catname' =>$catname,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_category_delete", methods="DELETE")
     */
    public function delete(Request $request, Category $category): Response
    {
        if ($this->isCsrfTokenValid('delete'.$category->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($category);
            $em->flush();
        }

        return $this->redirectToRoute('admin_category_index');
    }
}
